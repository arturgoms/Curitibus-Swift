//
//  AuthGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import FirebaseAuth

protocol AuthGateway {
    func getCurrentUser(completion: @escaping (_ result: Result<User>) -> Void)
    func googleSignIn(completion: @escaping (_ result: Result<Void>) -> Void)
    func facebookSignIn(completion: @escaping (_ result: Result<Void>) -> Void)
    func twitterSignIn(completion: @escaping (_ result: Result<Void>) -> Void)
}
