//
//  UserGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol UserGateway {
    func signIn(parameters: SignInReq, completion: @escaping (_ result: Result<User, Error>) -> Void)
}
