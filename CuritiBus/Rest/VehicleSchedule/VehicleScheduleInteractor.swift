//
//  VehicleScheduleInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper
import FirebaseDatabase

class VehicleScheduleInteractor: BaseInteractor {
    
    let provider = RxMoyaProvider<VehicleScheduleEndpoint>()
    let disposeBag = DisposeBag()
    
    func getVehicleSchedule(vehicleCod: String, success:@escaping (_ vehicleSchedules: [VehicleSchedule]) -> Void, error: ((ErrorResponse) -> Void)? = nil) {
        
        let ref = DBManager.ref.child("urbs").child("schedules").child("vehicle").child(vehicleCod)
        let loadRemote = {
            let apiObserver = APIObserver<[VehicleSchedule]>(success: { vehicleSchedules in
                
                self.persist(reference: ref, data: ["list": vehicleSchedules.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(vehicleSchedules)
                
            }, error: error)
            
            self.provider.request(VehicleScheduleEndpoint.getVehicleSchedule(vehicleCod: vehicleCod))
                .mapArray(VehicleSchedule.self)
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .days(1), success: success, fallBack: loadRemote)
        
    }
    
}
