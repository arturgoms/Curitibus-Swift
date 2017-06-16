//
//  LineEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

enum LineEndpoint {
    case getUrbsLines
    case getMetroLines
}

extension LineEndpoint: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getUrbsLines:
            return URL(string: BaseURL.urbs.rawValue)!
            
        case .getMetroLines:
            return URL(string: BaseURL.transdatasmart.rawValue)!
        }
    }
    
    var path: String {
        switch self {
        case .getUrbsLines:
            return Endpoints.getLinhas.url
            
        case .getMetroLines:
            return Endpoints.buscaLinha.url
        }
    }
    
    var method: Method {
        switch self {
        case .getUrbsLines,
             .getMetroLines:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getUrbsLines:
            return ["c": accessKey]
            
        case .getMetroLines:
            return ["nomeOuNumero": ""]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getUrbsLines,
             .getMetroLines:
            return URLEncoding.queryString
        }
    }
    
}
