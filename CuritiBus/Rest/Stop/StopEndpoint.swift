//
//  StopEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

enum StopEndpoint {
    case getUrbsStops(lineCod: String)
    
    case getMetroPaths(lineId: Int)
    case getMetroStops(lineId: Int, pathId: Int)
}

extension StopEndpoint: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getUrbsStops(_):
            return URL(string: BaseURL.urbs.rawValue)!
            
        case .getMetroPaths(_),
            .getMetroStops(_):
            return URL(string: BaseURL.transdatasmart.rawValue)!
        }
    }
    
    var path: String {
        switch self {
        case .getUrbsStops(_):
            return Endpoints.getPontosLinha.url
            
        case .getMetroPaths(_):
            return Endpoints.trajetosLinha.url
            
        case .getMetroStops(_):
            return Endpoints.pontosPorTrajeto.url
        }
    }
    
    var method: Method {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getUrbsStops(let lineCod):
            return ["linha": lineCod, "c": accessKey]
            
        case .getMetroPaths(let lineId):
            return ["idLinha": lineId]
            
        case .getMetroStops(let lineId, let pathId):
            return ["idLinha": lineId, "idTrajeto": pathId]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
}
