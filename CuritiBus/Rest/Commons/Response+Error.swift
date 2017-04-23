//
//  Response+Error.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

extension Response {
    
    var errorObject: ErrorResponse {
        
        do {
            if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any], let errorObj = ErrorResponse(JSON: jsonDictionary) {
                return errorObj
            }
        } catch {}
        
        return ErrorResponse.defaultError()
        
    }
    
}
