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
    
    // swiftlint:disable function_body_length
    private class func responseFor(url: URL) -> String {
        switch url.path {
        case "/lines":
            return """
            [
                {
                    "id":1,
                    "name":"Centenário Rui Barbosa",
                    "source":1,
                    "color":"#ecde00"
                },
                {
                    "id":2,
                    "name":"Cajuru",
                    "source":2,
                    "color":"#f57627"
                },
                {
                    "id":3,
                    "name":"Cristo Rei",
                    "source":1,
                    "color":"#fa2538"
                },
                {
                    "id":4,
                    "name":"Ligeirão Boquerão",
                    "source":2,
                    "color":"#278131"
                },
                {
                    "id":5,
                    "name":"Sta Cândida Cpo Comprido",
                    "source":1,
                    "color":"#fcfcfa"
                },
                {
                    "id":6,
                    "name":"Pinhais Rui Barbosa",
                    "source":2,
                    "color":"#00bae9"
                },
                {
                    "id":7,
                    "name":"Aeroporto",
                    "source":2,
                    "color":"#0060e3"
                },
                {
                    "id":8,
                    "name":"Interbairros II",
                    "source":1,
                    "color":"#ecde00"
                },
                {
                    "id":9,
                    "name":"Inter II",
                    "source":1,
                    "color":"#a13a3e"
                },
                {
                    "id":10,
                    "name":"Estudantes",
                    "source":1,
                    "color":"#FFFFFF"
                }
            ]
            """
            
        default:
            return ""
        }
    }
    // swiftlint:enable function_body_length
    
}
