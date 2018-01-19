//
//  Errors.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 16/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation

enum GatewayError: Error {
    case noUserStored
    case emptyChargesList
}

enum APIError: Error {
    case remote(message: String)
    case underlying(error: Error)
    case unknown(request: URLRequest?, response: HTTPURLResponse?)
    
    func message() -> String {
        switch self {
        case .remote(let message):
            return message
            
        case .underlying(let error):
            return error.localizedDescription
            
        case .unknown:
            return "ERROR_UNKNOWN_MESSAGE".localized
        }
    }
}
