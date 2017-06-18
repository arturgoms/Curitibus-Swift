//
//  StopInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper
import FirebaseDatabase

class StopInteractor: BaseInteractor {
    
    let provider = RxMoyaProvider<StopEndpoint>()
    let disposeBag = DisposeBag()
    
    func getUrbsStops(line: Line, success:@escaping (_ stops: [UrbsStop]) -> Void, error: ((ErrorResponse?) -> Void)? = nil) {
        
        guard let lineCod = line.cod else {
            error?(nil)
            return
        }
        
        let ref = DBManager.ref.child("urbs").child("stops").child(lineCod)
        let loadRemote = {
            let apiObserver = APIObserver<[UrbsStop]>(success: { stops in
                
                self.persist(reference: ref, data: ["list": stops.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(stops)
                
            }, error: error)
            
            self.provider.request(StopEndpoint.getUrbsStops(lineCod: lineCod))
                .mapArray(UrbsStop.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
    func getMetroPaths(line: Line, success:@escaping (_ paths: [MetroPath]) -> Void, error: ((ErrorResponse?) -> Void)? = nil) {
        
        guard let line = line as? MetroLine, let lineId = line.id, let lineCod = line.cod else {
            error?(nil)
            return
        }
        
        let ref = DBManager.ref.child("metro").child("paths").child(lineCod)
        let loadRemote = {
            let apiObserver = APIObserver<[MetroPath]>(success: { paths in
                
                self.persist(reference: ref, data: ["list": paths.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(paths)
                
            }, error: error)
            
            self.provider.request(StopEndpoint.getMetroPaths(lineId: lineId))
                .mapArray(MetroPath.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
    func getMetroStops(line: Line, path: MetroPath, success:@escaping (_ stops: [MetroStopsCourse]) -> Void, error: ((ErrorResponse?) -> Void)? = nil) {
        
        guard let line = line as? MetroLine, let lineId = line.id, let lineCod = line.cod, let pathId = path.id else {
            error?(nil)
            return
        }
        
        let ref = DBManager.ref.child("metro").child("stops").child(lineCod).child("\(pathId)")
        let loadRemote = {
            let apiObserver = APIObserver<[MetroStopsCourse]>(success: { paths in
                
                self.persist(reference: ref, data: ["list": paths.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(paths)
                
            }, error: error)
            
            self.provider.request(StopEndpoint.getMetroStops(lineId: lineId, pathId: pathId))
                .mapArray(MetroStopsCourse.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
}
