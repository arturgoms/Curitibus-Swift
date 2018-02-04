//
//  URLs.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

// MARK: - Enums

enum APIBaseUrl {
    case production
    case development
    
    var url: String {
        switch self {
        case .production:
            return Secrets.kApiBaseUrl
        case .development:
            return Secrets.kApiDevBaseUrl
        }
    }
}

enum APIEndpointPath: String {
    case lines = "/lines"
}

// MARK: - Extensions

extension APIBaseUrl {
    static var current: APIBaseUrl {
        #if DEBUG
            return .production
        #else
            return .production
        #endif
    }
}

extension APIEndpointPath {
    var fullUrl: String {
        return APIBaseUrl.current.url + rawValue
    }
}
