//
//  VehicleInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper
import FirebaseDatabase

class VehicleInteractor: BaseInteractor {
    
    let provider = RxMoyaProvider<VehicleEndpoint>()
    let disposeBag = DisposeBag()
    
    func getVehicles(lineCod: String, success:@escaping (_ vehicles: [Vehicle]) -> Void, error: ((ErrorResponse?) -> Void)? = nil) {
        
        let ref = DBManager.ref.child("urbs").child("vehicles").child(lineCod)
        let loadRemote = {
            let apiObserver = APIObserver<Any>(success: { vehiclesDict in
                
                guard let vehiclesDict = vehiclesDict as? [String: Any] else {
                    error?(nil)
                    return
                }
                
                var vehicles = [Vehicle]()
                vehiclesDict.keys
                    .map({ return vehiclesDict[$0] as! [String: Any] })
                    .forEach({ vehicles.append(Vehicle(JSON: $0)!) })
                
                self.persist(reference: ref, data: ["list": vehicles.toJSON(), "last_updated": Date().timeIntervalSince1970])
                success(vehicles)
                
            }, error: error)
            
            self.provider.request(VehicleEndpoint.getVehicles(lineCod: lineCod))
                .mapJSON()
                .subscribe(apiObserver)
                .disposed(by: self.disposeBag)
        }
        
        loadListFromDb(reference: ref, limit: .minutes(2), success: success, fallBack: loadRemote)
        
    }
    
}
