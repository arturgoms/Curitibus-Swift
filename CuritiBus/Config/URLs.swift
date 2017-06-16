//
//  URLs.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

enum BaseURL: String {
    case urbs = "http://transporteservico.urbs.curitiba.pr.gov.br"
    case transdatasmart = "http://00291.transdatasmart.com.br:8291/RestLibrary/LinhaService"
}

enum Endpoints {
    case getLinhas
    case getVeiculosLinha
    case getTabelaLinha
    case getTabelaVeiculo
    
    case buscaLinha
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
            
        case .buscaLinha:
            return "/Busca"
        }
    }
}
