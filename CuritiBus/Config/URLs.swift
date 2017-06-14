//
//  URLs.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

enum BaseURL: String {
    case urbs = "http://transporteservico.urbs.curitiba.pr.gov.br"
}

enum Endpoints {
    case getLinhas
    case getVeiculosLinha
    case getTabelaLinha
    case getTabelaVeiculo
}

extension Endpoints {
    
    var url: String {
        switch self {
            
        case .getLinhas:
            return "/getLinhas.php"
            
        case .getVeiculosLinha:
            return "/getVeiculos.php"
            
        case .getTabelaLinha:
            return "/getTabelaLinha.php"
            
        case .getTabelaVeiculo:
            return "/getTabelaVeiculo.php"
        }
    }
}
