//
//  LineSchedule.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class LineSchedule: Mappable {
    
    var timeStr: String?
    var stop: String?
    var dayStr: Int?
    var numStr: String?
    var tableStr: String?
    var adapt: String?
    var cod: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        timeStr <- map["HORA"]
        stop <- map["PONTO"]
        dayStr <- map["DIA"]
        numStr <- map["NUM"]
        tableStr <- map["TABELA"]
        adapt <- map["ADAPT"]
        cod <- map["COD"]
    }
    
}

