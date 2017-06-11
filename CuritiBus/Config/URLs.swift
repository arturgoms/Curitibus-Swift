//
//  URLs.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation

enum Endpoints {
    case base
    case getLinhas
}

extension Endpoints {
    
    var url: String {
        switch self {
            
        case .base:
            return "http://transporteservico.urbs.curitiba.pr.gov.br"
            
        case .getLinhas:
            return "/getLinhas.php"
        }
    }
}
