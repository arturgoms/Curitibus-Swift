//
//  MetroShapesCourse.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class MetroShapesCourse: Mappable {
    
    var courseStr: String?
    var shapes: [MetroShape]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        courseStr <- map["Key"]
        shapes <- map["Value"]
    }
    
}
