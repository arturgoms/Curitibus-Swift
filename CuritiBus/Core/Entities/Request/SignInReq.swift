//
//  SignInReq.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

enum SignInProvider: String, Codable {
    case apple
    case facebook
    case google
}

struct SignInReq: Codable {
    let provider: SignInProvider
    let providerID: String
    let name: String
    let email: String
}
