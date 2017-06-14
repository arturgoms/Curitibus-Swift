//
//  LineScheduleInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper
import FirebaseDatabase

class LineScheduleInteractor: BaseInteractor {
    
    let provider = RxMoyaProvider<LineScheduleEndpoint>()
    let disposeBag = DisposeBag()
    
    func getLineSchedule(lineCod: String, success:@escaping (_ lineSchedules: [LineSchedule]) -> Void, error: ((ErrorResponse) -> Void)? = nil) {
        
        let ref = DBManager.ref.child("urbs").child("schedules").child("line").child(lineCod)
        let loadRemote = {
            let apiObserver = APIObserver<[LineSchedule]>(success: { lineSchedules in
                
                self.persist(reference: ref, data: ["list": lineSchedules.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(lineSchedules)
                
            }, error: error)
            
            self.provider.request(LineScheduleEndpoint.getLineSchedule(lineCod: lineCod))
                .mapArray(LineSchedule.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
        
    }
    
}
