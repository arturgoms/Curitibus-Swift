//
//  GatewayFactory.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

struct GatewayFactory {
    static var api: APIGatewayFactory = APIGatewayFactory()
}

struct APIGatewayFactory {
    
    private var apiClient: APIClient = APIClient(strategy: APIDefaultStrategy(), adapters: [])
    
    var user: UserGateway {
        return APIUserGateway(apiClient: apiClient)
    }
    
}
