//
//  Line.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

enum LineSource: Int, Codable {
    case urbs = 1
    case metrocard = 2
}

struct Line: Codability {
    var id: Int
    var name: String
    var color: String
    var source: LineSource
}
