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
    
    var httpStatus: Int?
    var message: String?
    var errors: [ErrorDescription] = []
    
    init(errors:[ErrorDescription]) {
        self.errors = errors
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        errors <- map["errors"]
    }
    
    class func defaultError() -> ErrorResponse {
        return ErrorResponse(errors: [ErrorDescription.defaultError()])
    }
    
}

class ErrorDescription: Mappable {
    
    var title: String?
    var status: Int?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        status <- map["status"]
        
        if status == nil, let statusStr: String = map["status"].value(), let statusInt = Int(statusStr) {
            status = statusInt
        }
    }
    
    class func defaultError() -> ErrorDescription {
        let error = ErrorDescription()
        error.title = "Ocorreu um erro."
        return error
    }
    
}
