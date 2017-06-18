//
//  UrbsLine.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import ObjectMapper

class UrbsLine: Mappable, Line {
    
    var category: String?
    var cod: String?
    var name: String?
    var colorName: String?
    var cardOnlyStr: String?
    var source: LineSource = .urbs
    
    var type: LineType {
        return LineType.type(category: category ?? "")
    }
    
    var categoryName: String? {
        return category?.capitalized
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        category <- map["CATEGORIA_SERVICO"]
        cod <- map["COD"]
        name <- map["NOME"]
        colorName <- map["NOME_COR"]
        cardOnlyStr <- map["SOMENTE_CARTAO"]
    }
    
}
