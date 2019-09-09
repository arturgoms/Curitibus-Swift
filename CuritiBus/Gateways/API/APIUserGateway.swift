//
//  APIUserGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

struct APIUserGateway: UserGateway {
    
    let apiClient: APIClient
    
    func signIn(parameters: SignInReq, completion: @escaping (Result<User, Error>) -> Void) {
        let request = SignInRequest(parameter: parameters)
        
        apiClient.execute(apiRequest: request) { (result: Result<User, APIError>) in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
