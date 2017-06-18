//
//  Line.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 15/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

enum LineSource: Int {
    case urbs = 0
    case metro = 1
}

enum LineType {
    case convencional
    case alimentador
    case troncal
    case linhaDireta
    case expresso
    case interbairros
    case circularCentro
    case ensinoEspecial
    case ligeirao
    case madrugueiro
    case jardineira
    case metropolitano
    case unknown
    
    static func type(category: String) -> LineType {
        switch category {
        case "CONVENCIONAL":
            return .convencional
            
        case "ALIMENTADOR":
            return .alimentador
            
        case "TRONCAL":
            return .troncal
            
        case "LINHA DIRETA":
            return .linhaDireta
            
        case "EXPRESSO":
            return .expresso
            
        case "INTERBAIRROS":
            return .interbairros
            
        case "CIRCULAR CENTRO":
            return .circularCentro
            
        case "ENSINO ESPECIAL":
            return .ensinoEspecial
            
        case "LIGEIRÃO":
            return .ligeirao
            
        case "MADRUGUEIRO":
            return .madrugueiro
            
        case "JARDINEIRA":
            return .jardineira
            
        default:
            return .unknown
        }
    }
}

extension LineType {
    
    var color: UIColor {
        switch self {
        case .unknown:
            return UIColor(hex: 0xFFFFFF)
            
        case .convencional:
            return UIColor(hex: 0xecde00)
            
        case .alimentador:
            return UIColor(hex: 0xf57627)
            
        case .troncal:
            return UIColor(hex: 0xecde00)
            
        case .linhaDireta:
            return UIColor(hex: 0xbebfc3)
            
        case .expresso:
            return UIColor(hex: 0xfa2538)
            
        case .interbairros:
            return UIColor(hex: 0x278131)
            
        case .circularCentro:
            return UIColor(hex: 0x000000)
            
        case .ensinoEspecial:
            return UIColor(hex: 0x00bae9)
            
        case .ligeirao:
            return UIColor(hex: 0x0060e3)
            
        case .madrugueiro:
            return UIColor(hex: 0xecde00)
            
        case .jardineira:
            return UIColor(hex: 0x00d93d)
            
        case .metropolitano:
            return UIColor(hex: 0xa70000)
        }
    }
    
}

protocol Line {
    
    var cod: String? { get }
    var name: String? { get }
    var source: LineSource { get }
    var type: LineType { get }
    var categoryName: String? { get }
    
}
