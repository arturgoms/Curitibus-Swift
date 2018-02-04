//
//  ListLinesEndpoint.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

class ListLinesEndpoint: APIEndpoint {
    
    var url: APIEndpointPath = .lines
    var method: APIMethod = .get
    var encoding: APIEncoding = .queryString
    var parameter: APIParameterObject?
    
}
