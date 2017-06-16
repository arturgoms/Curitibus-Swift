//
//  MetroLine.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 15/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class MetroLine: Mappable, Line {
    
    var cod: String?
    var id: Int?
    var name: String?
    var source: LineSource = .metro
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cod <- map["Numero"]
        id <- map["Id"]
        name <- map["Nome"]
    }
    
}
