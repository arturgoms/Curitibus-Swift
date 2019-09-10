//
//  SignInUseCase.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ISignInUseCase {
    func signIn(provider: SignInProvider, providerID: String, name: String, email: String, completion: @escaping (_ result: Result<User, Error>) -> Void)
}

struct SignInUseCase: ISignInUseCase {

    let gateway: UserGateway
    
    func signIn(provider: SignInProvider, providerID: String, name: String, email: String, completion: @escaping (Result<User, Error>) -> Void) {
        let parameters = SignInReq(provider: provider, providerID: providerID, name: name, email: email)
        gateway.signIn(parameters: parameters, completion: completion)
    }

}
