//
//  LoggerPlugin.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya
import Result

class LoggerPlugin: PluginType {
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        if let method = request.httpMethod, let url = request.url?.absoluteString.removingPercentEncoding {
            print("\(method): \(url)")
            
            if let body = request.httpBody {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: body, options: [])
                    let prettyJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                    if let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) {
                        print(prettyPrintedJson)
                    }
                } catch {}
            }
        }
        
        return request
        
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        
        var code: Int?
        var url: String?
        
        switch result {
        case .success(let object):
            code = object.statusCode
            url = object.request?.url?.absoluteString.removingPercentEncoding
            
        case .failure(let error):
            code = error.response?.statusCode
            url = error.response?.request?.url?.absoluteString.removingPercentEncoding
        }
        
        if let code = code, let url = url {
            print("\(code): \(url)")
        }
        
    }
    
}
