//
//  VehicleScheduleEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

enum VehicleScheduleEndpoint {
    case getVehicleSchedule(vehicleCod: String)
}

extension VehicleScheduleEndpoint: TargetType {
    
    var path: String {
        switch self {
        case .getVehicleSchedule(_):
            return Endpoints.getTabelaVeiculo.url
        }
    }
    
    var method: Method {
        switch self {
        case .getVehicleSchedule(_):
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getVehicleSchedule(let vehicleCod):
            return ["carro": vehicleCod, "c": accessKey]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getVehicleSchedule(_):
            return URLEncoding.queryString
        }
    }
    
}
