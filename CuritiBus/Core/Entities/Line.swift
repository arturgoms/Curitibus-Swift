//
//  Line.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

enum LineSource: Int, Codable {
    case urbs = 1
    case metrocard = 2
}

struct Line: Codability {
    var id: Int
    var name: String
    var colorString: String
    var source: LineSource
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case colorString = "color"
        case source
    }
    
    var color: UIColor {
        return UIColor(hex: colorString)
    }
}
