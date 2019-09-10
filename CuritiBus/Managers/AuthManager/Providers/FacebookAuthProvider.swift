//
//  FacebookAuthProvider.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import FacebookLogin

struct FacebookAuthProvider: AuthProvider {
    
    func hasSession(handler: @escaping (Bool) -> Void) {
        handler(AccessToken.isCurrentAccessTokenActive)
    }
    
    func logout() {
        LoginManager().logOut()
    }
    
}
