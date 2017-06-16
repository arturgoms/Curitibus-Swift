//
//  Line.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 15/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

enum LineSource: Int {
    case urbs = 0
    case metro = 1
}

protocol Line {
    
    var cod: String? { get }
    var name: String? { get }
    var source: LineSource { get }
    
}
