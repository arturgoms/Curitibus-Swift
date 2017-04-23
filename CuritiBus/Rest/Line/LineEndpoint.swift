//
//  LineEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

enum LineEndpoint {
    case getAllLines
}

extension LineEndpoint: TargetType {
    
    var path: String {
        return Endpoints.getLinhas.url
    }
    
    var method: Method {
        return .get
    }
    
    var parameters: [String : Any]? {
        return ["c": accessKey]
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
}
