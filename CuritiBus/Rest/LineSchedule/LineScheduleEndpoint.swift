//
//  LineScheduleEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

enum LineScheduleEndpoint {
    case getLineSchedule(lineCod: String)
}

extension LineScheduleEndpoint: TargetType {
    
    var path: String {
        switch self {
        case .getLineSchedule(_):
            return Endpoints.getTabelaLinha.url
        }
    }
    
    var method: Method {
        switch self {
        case .getLineSchedule(_):
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getLineSchedule(let lineCod):
            return ["linha": lineCod, "c": accessKey]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getLineSchedule(_):
            return URLEncoding.queryString
        }
    }
    
}
