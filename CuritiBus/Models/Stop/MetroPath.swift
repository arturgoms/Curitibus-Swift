//
//  MetroPath.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class MetroPath: Mappable {
    
    var id: Int?
    var name: String?
    var lineId: Int?
    
    //Internal
    var courses = [MetroStopsCourse]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["IdTrajeto"]
        name <- map["NomeTrajeto"]
        lineId <- map["IdLinha"]
    }
    
}
