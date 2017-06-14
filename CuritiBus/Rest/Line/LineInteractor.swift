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
    
    func getAllLines(success:@escaping (_ lines: [Line]) -> Void, error: ((ErrorResponse) -> Void)? = nil) {
        
        let ref = DBManager.ref.child("urbs").child("lines")
        let loadRemote = {
            let apiObserver = APIObserver<[Line]>(success: { lines in
                
                self.persist(reference: ref, data: ["list": lines.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(lines)
                
            }, error: error)
            
            self.provider.request(LineEndpoint.getAllLines)
                .mapArray(Line.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
        
    }
    
}
