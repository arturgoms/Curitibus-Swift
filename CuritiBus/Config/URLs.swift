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
    case getPontosLinha
    case getVeiculosLinha
    case getTabelaLinha
    case getTabelaVeiculo
    
    case buscaLinha
    case trajetosLinha
    case buscarRetas
    case pontosPorTrajeto
}

extension Endpoints {
    
    var url: String {
        switch self {
        
        //URBS
        case .getLinhas:
            return "/getLinhas.php"
            
        case .getPontosLinha:
            return "/getPontosLinha.php"
            
        case .getVeiculosLinha:
            return "/getVeiculos.php"
            
        case .getTabelaLinha:
            return "/getTabelaLinha.php"
            
        case .getTabelaVeiculo:
            return "/getTabelaVeiculo.php"
            
        //Metro
        case .buscaLinha:
            return "/Busca"
            
        case .trajetosLinha:
            return "/Trajetos"
            
        case .buscarRetas:
            return "/BuscarRetas"
            
        case .pontosPorTrajeto:
            return "/PontosPorTrajeto"
        }
        
    }
}
