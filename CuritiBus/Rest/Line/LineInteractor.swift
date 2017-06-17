//
//  LineInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper
import FirebaseDatabase

class LineInteractor: BaseInteractor {
    
    let provider = RxMoyaProvider<LineEndpoint>()
    let disposeBag = DisposeBag()
    
    func getUrbsLines(success:@escaping (_ lines: [UrbsLine]) -> Void, error: ((ErrorResponse) -> Void)? = nil) {
        
        let ref = DBManager.ref.child("urbs").child("lines")
        let loadRemote = {
            let apiObserver = APIObserver<[UrbsLine]>(success: { lines in
                
                self.persist(reference: ref, data: ["list": lines.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(lines)
                
            }, error: error)
            
            self.provider.request(LineEndpoint.getUrbsLines)
                .mapArray(UrbsLine.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
    func getMetroLines(success:@escaping (_ lines: [MetroLine]) -> Void, error: ((ErrorResponse) -> Void)? = nil) {
        
        let ref = DBManager.ref.child("metro").child("lines")
        let loadRemote = {
            let apiObserver = APIObserver<[MetroLine]>(success: { lines in
                
                self.persist(reference: ref, data: ["list": lines.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(lines)
                
            }, error: error)
            
            self.provider.request(LineEndpoint.getMetroLines)
                .mapArray(MetroLine.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
    func getUserLines(success:@escaping (_ lines: [Line]) -> Void, error: ((NSError) -> Void)? = nil) {
        
        guard let userId = SessionManager.userId() else {
            SessionManager.logout()
            return
        }
        
        let ref = DBManager.ref.child("users").child(userId).child("lines").queryOrdered(byChild: "index")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            var lines = [Line]()
            for child in snapshot.children {
                if let foundLine = UserLinesManager.allLines.first(where: { $0.cod == (child as! DataSnapshot).key }) {
                    lines.append(foundLine)
                }
            }
            
            UserLinesManager.userLines = lines
            success(lines)
            
        }, withCancel: { errorObj in
            error?(errorObj as NSError)
        })
        
    }
    
    func addUserLine(line: Line, success:(() -> Void)? = nil, error: ((NSError?) -> Void)? = nil) {
        
        guard let userId = SessionManager.userId() else {
            SessionManager.logout()
            return
        }
        
        guard let lineCod = line.cod else {
            error?(nil)
            return
        }
        
        guard !UserLinesManager.userLines.contains(where: { $0.cod == line.cod }) else {
            success?()
            return
        }
        
        UserLinesManager.userLines.append(line)
        let index = Int(UserLinesManager.userLines.index(where: { $0.cod == line.cod })!)
        
        let ref = DBManager.ref.child("users").child(userId).child("lines").child(lineCod)
        ref.setValue(["index": index, "source": line.source.rawValue]) { (errorObj, ref) in
            
            if let errorObj = errorObj {
                error?(errorObj as NSError)
            } else {
                success?()
            }
            
        }
        
    }
    
    func deleteUserLine(line: Line, success:(() -> Void)? = nil, error: ((NSError?) -> Void)? = nil) {
        
        guard let userId = SessionManager.userId() else {
            SessionManager.logout()
            return
        }
        
        guard let index = UserLinesManager.userLines.index(where: { $0.cod == line.cod }) else {
            success?()
            return
        }
        
        UserLinesManager.userLines.remove(at: Int(index))
        
        let ref = DBManager.ref.child("users").child(userId).child("lines")
        
        var linesDict = [String: Any]()
        var idx = 0
        UserLinesManager.userLines.forEach { line in
            linesDict[line.cod!] = ["index": idx, "source": line.source.rawValue]
            idx += 1
        }
        
        ref.setValue(linesDict) { (errorObj, ref) in
          
            if let errorObj = errorObj {
                error?(errorObj as NSError)
            } else {
                success?()
            }
            
        }
        
    }
    
}
