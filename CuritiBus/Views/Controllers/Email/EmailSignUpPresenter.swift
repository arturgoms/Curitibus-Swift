//
//  EmailSignUpPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseAuth

class EmailSignUpPresenter: IEmailPresenter {
    
    weak var view: IEmailView?
    
    func viewType() -> EmailViewType {
        return .signUp
    }
    
    func authenticate(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.view?.userDidAuthenticate()
            } else {
                self.view?.userAuthenticationDidFail(error: error)
            }
        }
    }
    
    func recover(email: String) {
        
    }
    
}
