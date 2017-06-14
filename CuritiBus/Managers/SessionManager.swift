//
//  SessionManager.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseAuth

class SessionManager {
    
    class func userId() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    class func logout() {
        do {
            try Auth.auth().signOut()
        } catch { }
        
        Storyboard.currentViewController()?.navigate(.register(RegisterPresenter()))
    }
    
}
