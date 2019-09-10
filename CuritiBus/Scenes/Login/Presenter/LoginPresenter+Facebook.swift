//
//  LoginPresenter+Facebook.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import FacebookCore
import FacebookLogin

extension LoginPresenter: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        GraphRequest(graphPath: "me", parameters: ["fields": "email, name"]).start { (connection, graphResult, error) in
            let graphResult = graphResult as? [String: String]
            guard let userID = graphResult?["id"], let name = graphResult?["name"], let email = graphResult?["email"] else {
                LoginManager().logOut()
                return
            }
            
            self.signInWith(provider: .facebook, providerID: userID, name: name, email: email)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        AuthManager.shared.logout()
    }
    
}
