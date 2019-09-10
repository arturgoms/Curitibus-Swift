//
//  LoginPresenter+Apple.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import AuthenticationServices

@available(iOS 13.0, *)
extension LoginPresenter: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            //self.view?.loginFailure(error: error)
            return
        }
        
        let user = appleIDCredential.user
        UserDefaults.standard.set(user, forKey: "apple_provider_id")
        
        if let name = appleIDCredential.fullName?.givenName, let email = appleIDCredential.email {
            appleIDCredential.save()
            self.signInWith(provider: .apple, providerID: user, name: name, email: email)
            
        } else if let name = appleIDCredential.savedName, let email = appleIDCredential.savedEmail {
            self.signInWith(provider: .apple, providerID: user, name: name, email: email)
            
        } else {
            //self.view?.loginFailure(error: error)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.view?.loginFailure(error: error)
    }
    
}
