//
//  ShapeEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

enum ShapeEndpoint {
    case getUrbsShapes(lineCod: String)
    
    case getMetroShapes(lineId: Int, pathId: Int)
}

extension ShapeEndpoint: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getUrbsShapes(_):
            return URL(string: BaseURL.urbs.rawValue)!
            
        case .getMetroShapes(_):
            return URL(string: BaseURL.transdatasmart.rawValue)!
        }
    }
    
    var path: String {
        switch self {
        case .getUrbsShapes(_):
            return Endpoints.getShapeLinha.url
            
        case .getMetroShapes(_):
            return Endpoints.buscarRetas.url
        }
    }
    
    var method: Method {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getUrbsShapes(let lineCod):
            return ["linha": lineCod, "c": accessKey]
            
        case .getMetroShapes(let lineId, let pathId):
            return ["idLinha": lineId, "idTrajeto": pathId]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
}
