//
//  HttpMocks.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import OHHTTPStubs

class HttpMocks {
    
    class func setup() {
        
        OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
            return request.url?.absoluteString.contains(Secrets.kApiBaseUrl) == true
            
        }) { request -> OHHTTPStubsResponse in
            let url = request.url!
            let response = responseFor(url: url)
            let data = response.data(using: .utf8)!
            return OHHTTPStubsResponse(data: data, statusCode: 200, headers: nil)
        }
        
    }
    
    private class func responseFor(url: URL) -> String {
        switch url.path {
        case "/lines":
            return """
            [
                {
                  "id":1,
                  "name":"Teste1",
                  "source":1
                },
                {
                  "id":2,
                  "name":"Teste2",
                  "source":2
                }
            ]
            """
            
        default:
            return ""
        }
    }
    
}
