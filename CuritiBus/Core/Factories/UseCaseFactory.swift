//
//  UseCaseFactory.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol IUseCaseFactory {
    func createSignInUseCase() -> ISignInUseCase
}

struct UseCaseFactory: IUseCaseFactory {
    
    func createSignInUseCase() -> ISignInUseCase {
        return SignInUseCase(gateway: GatewayFactory.api.user)
    }
    
}
