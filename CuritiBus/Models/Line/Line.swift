//
//  Line.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class Line: Mappable {
    
    var category: String?
    var code: String?
    var name: String?
    var colorName: String?
    var cardOnlyStr: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        category <- map["CATEGORIA_SERVICO"]
        code <- map["COD"]
        name <- map["NOME"]
        colorName <- map["NOME_COR"]
        cardOnlyStr <- map["SOMENTE_CARTAO"]
    }
    
}
