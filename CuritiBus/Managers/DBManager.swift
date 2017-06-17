//
//  DBManager.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 12/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseDatabase

class DBManager {
    
//    static private var weakly = [Weak<DatabaseReference>]()
    static var ref = Database.database().reference()
    
//    class func getRef(path: String) -> DatabaseReference {
//        return Database.database().reference().child(path)
//    }
    
//    class func timer() {
//        
//        DispatchQueue(label: "teste").async {
//            while true {
//                DBManager.weakly.reap()
//                if (DBManager.weakly.count > 0) {
//                    print(DBManager.weakly.count)
//                }
//                usleep(500000)
//            }
//        }
//    }
    
}

//class Weak<T: AnyObject> {
//    
//    weak var value : T?
//    init (value: T) {
//        self.value = value
//    }
//    
//}
//
//extension Array where Element:Weak<DatabaseReference> {
//    
//    mutating func reap () {
//        self = self.filter { nil != $0.value }
//    }
//    
//}
