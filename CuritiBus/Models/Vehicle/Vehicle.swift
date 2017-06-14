//
//  Vehicle.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper
import CoreLocation

class Vehicle: Mappable {
    
    var cod: String?
    var refreshStr: String?
    var latStr: String?
    var lonStr: String?
    var lineCod: String?
    var adapt: Bool?
    var vehicleTypeStr: String?
    var tableStr: String?
    var situation: String?
    var tCount: Int?
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latStr = latStr, let lonStr = lonStr, let lat = Double(latStr), let lon = Double(lonStr) else {
            return nil
        }
        
        return CLLocationCoordinate2D(latitude:lat, longitude:lon)
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cod <- map["COD"]
        refreshStr <- map["REFRESH"]
        latStr <- map["LAT"]
        lonStr <- map["LON"]
        lineCod <- map["CODIGOLINHA"]
        adapt <- map["ADAPT"]
        vehicleTypeStr <- map["TIPO_VEIC"]
        tableStr <- map["TABELA"]
        situation <- map["SITUACAO"]
        tCount <- map["TCOUNT"]
    }
    
}
