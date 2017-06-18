//
//  ShapeInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper
import FirebaseDatabase

class ShapeInteractor: BaseInteractor {
    
    let provider = RxMoyaProvider<ShapeEndpoint>()
    let disposeBag = DisposeBag()
    
    func getUrbsShapes(line: Line, success:@escaping (_ shapes: [UrbsShape]) -> Void, error: ((ErrorResponse?) -> Void)? = nil) {
        
        guard let lineCod = line.cod else {
            error?(nil)
            return
        }
        
        let ref = DBManager.ref.child("urbs").child("shapes").child(lineCod)
        let loadRemote = {
            let apiObserver = APIObserver<[UrbsShape]>(success: { shapes in
                
                self.persist(reference: ref, data: ["list": shapes.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(shapes)
                
            }, error: error)
            
            self.provider.request(ShapeEndpoint.getUrbsShapes(lineCod: lineCod))
                .mapArray(UrbsShape.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
    func getMetroShapes(line: Line, path: MetroPath, success:@escaping (_ shapes: [MetroShapesCourse]) -> Void, error: ((ErrorResponse?) -> Void)? = nil) {
        
        guard let line = line as? MetroLine, let lineId = line.id, let lineCod = line.cod, let pathId = path.id else {
            error?(nil)
            return
        }
        
        let ref = DBManager.ref.child("metro").child("shapes").child(lineCod).child("\(pathId)")
        let loadRemote = {
            let apiObserver = APIObserver<[MetroShapesCourse]>(success: { shapes in
                
                self.persist(reference: ref, data: ["list": shapes.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(shapes)
                
            }, error: error)
            
            self.provider.request(ShapeEndpoint.getMetroShapes(lineId: lineId, pathId: pathId))
                .mapArray(MetroShapesCourse.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
    }
    
}
