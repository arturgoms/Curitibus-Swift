//
//  BaseMoyaProvider.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

extension RxMoyaProvider {
    
    convenience init() {
        
        #if DEBUG
            let plugins: [PluginType] = [ErrorWrapperPlugin(), LoggerPlugin()]
        #else
            let plugins: [PluginType] = []
        #endif
        
        self.init(endpointClosure: { (target) -> Endpoint<Target> in
            
            let endpoint: Endpoint<Target> = Endpoint<Target>(
                url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                method: target.method,
                parameters: target.parameters,
                parameterEncoding: target.parameterEncoding
            )

            return endpoint.adding(httpHeaderFields: target.headers())
            
        }, plugins: plugins)
        
    }
    
}
