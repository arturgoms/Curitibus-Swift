//
//  Environments.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

enum Environment: APIEnvionment {
    case production
    case development
    
    var baseUrl: String {
        switch self {
            case .production: return "http://localhost:8080"
            case .development: return "http://localhost:8080"
        }
    }
}
