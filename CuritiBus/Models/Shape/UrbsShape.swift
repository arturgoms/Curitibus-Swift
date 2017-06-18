//
//  UrbsShape.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class UrbsShape: Mappable {
    
    var shp: String?
    var latStr: String?
    var lonStr: String?
    var lineCod: String?
    
    var latitude: Double? {
        if let latStr = latStr?.replacingOccurrences(of: ",", with: ".") {
            return Double(latStr)
        }
        return nil
    }
    
    var longitude: Double? {
        if let lonStr = lonStr?.replacingOccurrences(of: ",", with: ".") {
            return Double(lonStr)
        }
        return nil
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        shp <- map["SHP"]
        latStr <- map["LAT"]
        lonStr <- map["LON"]
        lineCod <- map["COD"]
    }
    
}
