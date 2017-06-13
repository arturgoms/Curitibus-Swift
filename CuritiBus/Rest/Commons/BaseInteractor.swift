//
//  BaseInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 12/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper
import FirebaseDatabase

//MARK: - TimeLimit

enum TimeLimit {
    case minutes(Int)
    
    func valid(lastUpdated: TimeInterval) -> Bool {
        let timeDiff = Date().timeIntervalSince1970 - lastUpdated
        return timeDiff < self.timeInterval
    }
}

extension TimeLimit {
    
    var timeInterval: TimeInterval {
        switch self {
        case .minutes(let x):
            return TimeInterval(x * 60)
        }
    }
    
}

//MARK: - DB Functions

class BaseInteractor {
    
    func loadListFromDb<ObjClass:Mappable>(reference: DatabaseReference, limit: TimeLimit, success:@escaping ([ObjClass]) -> Void, fallBack:@escaping () -> Void) {
        
        reference.observeSingleEvent(of: .value, with: { snapshot in
            
            guard let result = snapshot.value as? [String: Any],
                let lastUpdated = result["last_updated"] as? TimeInterval,
                let list = result["list"] as? [[String: Any]] else {
                    fallBack()
                    return
            }
            
            guard limit.valid(lastUpdated: lastUpdated) else {
                fallBack()
                return
            }
            
            var objs = [ObjClass]()
            list.forEach({ objs.append(ObjClass(JSON: $0)!) })
            
            DBManager.goOffline()
            success(objs)
            
        }, withCancel: { error in
            fallBack()
        })
        
    }
    
    func persist(reference: DatabaseReference, data: Any?) {
        reference.setValue(data, withCompletionBlock: { (error, ref) in
            DBManager.goOffline()
        })
    }
    
}
