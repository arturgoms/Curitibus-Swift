//
//  MetroShape.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class MetroShape: Mappable {
    
    var lineId: Int?
    var pathId: Int?
    var startLatitude: Double?
    var endLatitude: Double?
    var startLongitude: Double?
    var endLongitude: Double?
    var order: Int?
    var direction: Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lineId <- map["IdLinha"]
        pathId <- map["IdTrajeto"]
        startLatitude <- map["LatitudeInicial"]
        endLatitude <- map["LatitudeFinal"]
        startLongitude <- map["LongitudeInicial"]
        endLongitude <- map["LongitudeFinal"]
        order <- map["Ordem"]
        direction <- map["Sentido"]
    }
    
}
