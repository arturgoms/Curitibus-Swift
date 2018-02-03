//
//  AuthGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol AuthGateway {
    func googleSignIn(completion: @escaping (_ result: Result<Void>) -> Void)
    func facebookSignIn(completion: @escaping (_ result: Result<Void>) -> Void)
    func twitterSignIn(completion: @escaping (_ result: Result<Void>) -> Void)
}
