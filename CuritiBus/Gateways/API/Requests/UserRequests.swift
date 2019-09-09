//
//  UserRequests.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

class SignInRequest: APIRequest {
    init(parameter: Codable) {
        let endpoint = APIEndpoint(environment: Environment.production, path: Endpoints.signIn)
        super.init(endpoint: endpoint, method: .post, encoding: .json(parameter))
    }
}
