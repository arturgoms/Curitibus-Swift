//
//  UrbsStop.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class UrbsStop: Mappable {
    
    var name: String?
    var numStr: String?
    var latStr: String?
    var lonStr: String?
    var seqStr: String?
    var groupStr: String?
    var direction: String?
    var type: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["NOME"]
        numStr <- map["NUM"]
        latStr <- map["LAT"]
        lonStr <- map["LON"]
        seqStr <- map["SEQ"]
        groupStr <- map["GRUPO"]
        direction <- map["SENTIDO"]
        type <- map["TIPO"]
    }
    
}
