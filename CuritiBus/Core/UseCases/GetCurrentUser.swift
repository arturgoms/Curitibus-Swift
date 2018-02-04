//
//  GetCurrentUser.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import FirebaseAuth

protocol IGetCurrentUserUseCase {
    func getCurrentUser(completion: @escaping (_ result: Result<User>) -> Void)
}

class GetCurrentUserUseCase: IGetCurrentUserUseCase {
    
    let authGateway: AuthGateway
    
    init(authGateway: AuthGateway) {
        self.authGateway = authGateway
    }
    
    func getCurrentUser(completion: @escaping (Result<User>) -> Void) {
        authGateway.getCurrentUser(completion: completion)
    }
    
}
