//
//  ErrorWrapperPlugin.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import Moya
import Result
import ObjectMapper

class ErrorWrapperPlugin: PluginType {
    
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {

        switch result {
            
        case .success(let object):
            
            if object.statusCode < 200 || object.statusCode > 299 {
                let response = Response(statusCode: object.statusCode, data: object.data)
                return Result.failure(MoyaError.statusCode(response))
            }
            
            else {
                
                // Response com data vazio
                if object.data.count == 0 {
                    
                    do {
                        let response = try Response(statusCode: object.statusCode, data: JSONSerialization.data(withJSONObject: [:], options: []))
                        return Result.success(response)
                    } catch {
                        return result
                    }
                }
                
            }
            
            return result
            
        case .failure(_):
            return result

        }
    }

}
