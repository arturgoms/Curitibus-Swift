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
    
    func googleSignIn(completion: @escaping (Result<Void>) -> Void) {
        
        Google().login { idToken, accessToken, error in
            
            guard let idToken = idToken, let accessToken = accessToken else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            Auth.auth().signIn(with: credential, completion: { user, error in
                if user != nil {
                    completion(.success(()))
                } else if let error = error {
                    completion(.failure(error))
                }
            })
            
        }
        
    }
    
    func facebookSignIn(completion: @escaping (Result<Void>) -> Void) {
        
        Facebook().login { _, accessToken, error in
            
            guard let accessToken = accessToken else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
            Auth.auth().signIn(with: credential, completion: { user, error in
                if user != nil {
                    completion(.success(()))
                } else if let error = error {
                    completion(.failure(error))
                }
            })
            
        }
        
    }
    
    func twitterSignIn(completion: @escaping (Result<Void>) -> Void) {
        
        TWTRTwitter.sharedInstance().logIn { session, error in
            
            guard let session = session else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
            Auth.auth().signIn(with: credential, completion: { user, error in
                if user != nil {
                    completion(.success(()))
                } else if let error = error {
                    completion(.failure(error))
                }
            })

        }
        
    }
    
}
