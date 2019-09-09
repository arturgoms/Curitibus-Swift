//
//  Urls.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

enum Endpoints: APIEndpointPath {
    case signIn
    
    var value: String {
        switch self {
            case .signIn: return "/signIn"
        }
    }
}
