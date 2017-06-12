//
//  RegisterPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseAuth
import Simplicity

class RegisterPresenter: IRegisterPresenter {
    
    weak var view: IRegisterView?
    
    func facebookSignIn() {
        let facebook = Facebook()
        facebook.scopes = ["public_profile", "email", "user_friends"]
        facebook.login({ (accessToken, _, _, _, error) in
            
            if let accessToken = accessToken {
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
                Auth.auth().signIn(with: credential) { (user, error) in
                    
                    if user != nil {
                        self.view?.userDidLogin()
                    } else {
                        self.view?.userLoginDidFail(error: error)
                    }
                    
                }
            }
        })
    }
    
    func googleSignIn() {
        Google().login({ (accessToken, _, idToken, _, error) in
            
            if let accessToken = accessToken, let idToken = idToken {
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
                Auth.auth().signIn(with: credential) { (user, error) in
                    
                    if user != nil {
                        self.view?.userDidLogin()
                    } else {
                        self.view?.userLoginDidFail(error: error)
                    }
                    
                }
                
            }
        })
    }
    
}
