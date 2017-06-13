//
//  DBManager.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 12/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseDatabase

class DBManager {
    
    static private var refCount = 0
    static var ref: DatabaseReference {
        get {
            refCount += 1
            Database.database().goOnline()
            return Database.database().reference()
        }
    }
    
    class func goOffline() {
        refCount -= 1
        if refCount <= 0 {
            refCount = 0
            Database.database().goOffline()
        }
    }
    
}
