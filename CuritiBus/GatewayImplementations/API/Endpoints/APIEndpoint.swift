//
//  APIEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 12/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import Alamofire

typealias APIParameterObject = Codability
typealias APIParameters = Parameters
typealias APIMethod = HTTPMethod

enum APIEncoding {
    case queryString
    case defaultEncoding
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .queryString:
            return URLEncoding.queryString
        case .defaultEncoding:
            return URLEncoding.default
        }
    }
}

// MARK: - APIEndpoint

protocol APIEndpoint {
    var url: APIEndpointPath { get }
    var method: APIMethod { get }
    var parameter: APIParameterObject? { get }
    var encoding: APIEncoding { get }
}

extension APIEndpoint {
    
    func request() -> Alamofire.DataRequest {
        
        var parameters: [String: Any]?
        if let parameter = parameter {
            parameters = parameter.encodeToJson()
        }
        
        return Alamofire.request(url.fullUrl, method: method, parameters: parameters, encoding: encoding.parameterEncoding, headers: [:])
    }
    
}
