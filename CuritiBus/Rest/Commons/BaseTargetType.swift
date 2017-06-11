//
//  BaseTargetType.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Moya

extension TargetType {
    
    var baseURL: URL {
        return URL(string: Endpoints.base.url)!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var task: Task {
        return .request
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var validate: Bool {
        return false
    }
    
    func headers() -> [String: String] {
        var headers = [String: String]()
        headers["User-Agent"] = UIDevice.current.userAgent
        return headers
    }
    
}
