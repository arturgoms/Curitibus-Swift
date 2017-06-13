//
//  DBManager.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 12/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseDatabase

class DBManager {
    
    static var ref: DatabaseReference {
        get {
            Database.database().goOnline()
            return Database.database().reference()
        }
    }
    
    class func goOffline() {
        Database.database().goOffline()
    }
    
}
