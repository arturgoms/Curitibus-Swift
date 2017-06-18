//
//  MetroStop.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class MetroStop: Mappable {
    
    var id: Int?
    var reference: String?
    var direction: Bool?
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var desc: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["Id"]
        reference <- map["Referencia"]
        direction <- map["Sentido"]
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
        address <- map["Endereco"]
        desc <- map["Descricao"]
    }
    
}
