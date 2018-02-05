//
//  FirebaseAuthGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import Simplicity
import FirebaseAuth

class FirebaseAuthGateway: AuthGateway {
    
    func getCurrentUser(completion: @escaping (Result<User>) -> Void) {
        if let user = Auth.auth().currentUser {
            completion(.success(user))
        } else {
            completion(.failure(GatewayError.noLoggedUser))
        }
    }
    
    func googleSignIn(completion: @escaping (Result<Void>) -> Void) {
        
        Google().login { idToken, accessToken, error in
            
            guard let idToken = idToken, let accessToken = accessToken else {
                return self.handleError(error: error, completion: completion)
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            self.signIn(credential: credential, completion: completion)
            
        }
        
    }
    
    func facebookSignIn(completion: @escaping (Result<Void>) -> Void) {
        
        Facebook().login { _, accessToken, error in
            
            guard let accessToken = accessToken else {
                return self.handleError(error: error, completion: completion)
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
            self.signIn(credential: credential, completion: completion)
            
        }
        
    }
    
    func twitterSignIn(completion: @escaping (Result<Void>) -> Void) {
        
//        TWTRTwitter.sharedInstance().logIn { session, error in
//
//            guard let session = session else {
//                return self.handleError(error: error, completion: completion)
//            }
//
//            let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
//            self.signIn(credential: credential, completion: completion)
//
//        }
        
    }
    
    private func handleError(error: Error?, completion: @escaping (Result<Void>) -> Void) {
        guard let error = error else { return }
        completion(.failure(error))
    }
    
    private func signIn(credential: AuthCredential, completion: @escaping (Result<Void>) -> Void) {
        Auth.auth().signIn(with: credential, completion: { user, error in
            if user != nil {
                completion(.success(()))
            } else if let error = error {
                completion(.failure(error))
            }
        })
    }
    
}
