//
//  LoginPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import AuthenticationServices
import FacebookCore
import FacebookLogin

protocol ILoginView: class {

}

protocol ILoginPresenter: ASAuthorizationControllerDelegate, LoginButtonDelegate {
    func signInWith(_ provider: SignInProvider)
}

class LoginPresenter: NSObject, ILoginPresenter {
    
    private(set) weak var view: ILoginView?
    
    internal init(view: ILoginView?) {
        self.view = view
    }
    
    func signInWith(_ provider: SignInProvider) {
//        switch provider {
//        case .facebook:
//            Simplicity.login(Facebook()) { accessToken, error in
//
//            }
//
//        case .google:
//            Simplicity.login(Google()) { accessToken, error in
//
//            }
//
//        default:
//            break
//        }
    }
    
    private func signInToServer(provider: SignInProvider, userID: String) {
        
    }

}

extension LoginPresenter: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard let userID = result?.token?.userID else {
            LoginManager().logOut()
            return
        }
        
        GraphRequest(graphPath: "me", parameters: ["fields": "email"]).start { (connection, result, error) in
            print(connection)
        }
        
        //signInToServer(provider: .facebook, accessToken: <#T##String#>)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logout")
    }
    
}

//@available(iOS 13.0, *)
//extension LoginPresenter: ASAuthorizationControllerDelegate {
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        print(authorization)
//    }
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        print(error)
//    }
//
//}
