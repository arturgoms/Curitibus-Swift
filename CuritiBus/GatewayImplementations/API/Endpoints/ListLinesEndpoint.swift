//
//  ListLinesEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

class ListLinesEndpoint: APIEndpoint {
    
    var url: String = ""
    var method: APIMethod = .get
    var encoding: APIEncoding = .queryString
    var parameter: APIParameterObject?
    
    init(parameter: APIParameterObject) {
        self.parameter = parameter
    }
    
}
