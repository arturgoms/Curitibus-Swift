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
}

extension Endpoints {
    
    var url: String {
        switch self {
            
        case .base:
            return "https://urbs.com.br/api/v2"
        }
    }
    
}
