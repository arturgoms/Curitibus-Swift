//
//  VehicleSchedule.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class VehicleSchedule: Mappable {
    
    var lineCod: String?
    var lineName: String?
    var vehicle: Int?
    var timeStr: String?
    var tableStr: String?
    var stopCod: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lineCod <- map["COD_LINHA"]
        lineName <- map["NOME_LINHA"]
        vehicle <- map["VEICULO"]
        timeStr <- map["HORARIO"]
        tableStr <- map["TABELA"]
        stopCod <- map["COD_PONTO"]
    }
    
}

