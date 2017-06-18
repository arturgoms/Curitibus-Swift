//
//  MetroStopsCourse.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class MetroStopsCourse: Mappable {
    
    var courseStr: String?
    var stops: [MetroStop]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        courseStr <- map["Key"]
        stops <- map["Value"]
    }
    
}
