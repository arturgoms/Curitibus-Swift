//
//  ErrorResponse.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import ObjectMapper

class EmptyResponse: Mappable {
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
}

class ErrorResponse: Mappable {
    
    var errors: [ErrorDescription] = []
    
    init(errors:[ErrorDescription]) {
        self.errors = errors
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errors <- map["errors"]
    }
    
    class func defaultError() -> ErrorResponse {
        return ErrorResponse(errors: [ErrorDescription.defaultError()])
    }
    
}

class ErrorDescription: Mappable {
    
    var title: String?
    var detail: String?
    var code: Int?
    var status: Int?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        detail <- map["detail"]
        code <- map["code"]
        status <- map["status"]
        
        if status == nil, let statusStr: String = map["status"].value(), let statusInt = Int(statusStr) {
            status = statusInt
        }
    }
    
    class func defaultError() -> ErrorDescription {
        let error = ErrorDescription()
        error.title = "Erro"
        error.detail = "Ocorreu um erro."
        return error
    }
    
}
