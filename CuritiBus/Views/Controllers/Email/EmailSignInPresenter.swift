//
//  EmailSignInPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import FirebaseAuth
import UIKit

class EmailSignInPresenter: IEmailPresenter {
    
    weak var view: IEmailView?
    
    func viewType() -> EmailViewType {
        return .signIn
    }
    
    func authenticate(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.view?.userDidAuthenticate()
            } else {
                self.view?.userAuthenticationDidFail(error: error)
            }
        }
    }
    
    func recover(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                AlertHelper.presentAlert(title: .error, message: error.localizedDescription, sender: self.view as? UIViewController)
            } else {
                AlertHelper.presentAlert(title: .warning, message: "RECOVERY_EMAIL_SENT".localized, sender: self.view as? UIViewController)
            }
        }
    }
    
}
