//
//  APIObserver.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import ObjectMapper
import Moya

class APIObserver<Element>: ObserverType {
    
    typealias SuccessClosure = (Element) -> Void
    typealias ErrorClosure = (ErrorResponse) -> Void
    typealias OnRetryClosure = () -> Void
    
    let successClosure: SuccessClosure?
    let errorClosure: ErrorClosure?
    let onRetryClosure: OnRetryClosure?
    
    init(success: SuccessClosure?, error: ErrorClosure?, onRetry: OnRetryClosure? = nil) {
        self.successClosure = success
        self.errorClosure = error
        self.onRetryClosure = onRetry
    }
    
    func on(_ event: Event<Element>) {
        
        switch event {
        case .next(let object):
            self.successClosure?(object)
            
        case .error(let error):
            let errorObject = self.errorObject(moyaError: error as? MoyaError)
            
            if let errorClosure = self.errorClosure {
                errorClosure(errorObject)
            } else {
                handleError(errorResponse: errorObject)
            }
        
        case .completed:
            break
        }
        
    }
    
    private func errorObject(moyaError: MoyaError?) -> ErrorResponse {
        
        switch moyaError! {
        case .statusCode(let response),
             .jsonMapping(let response),
             .imageMapping(let response),
             .stringMapping(let response):
            return response.errorObject
            
        case .requestMapping(let string):
            print(string)
            return ErrorResponse.defaultError()
        
        case .underlying(let error):
            print(error)
            return ErrorResponse.defaultError()
        }
    }
    
    private func handleError(errorResponse: ErrorResponse) {
        
        if let errorStatus = errorResponse.errors.first?.status, let errorCode = errorResponse.errors.first?.code, let onRetryClosure = onRetryClosure {
            switch (errorStatus, errorCode) {
                
            default:
                handleDefaultError(errorResponse: errorResponse)
            }
            
        } else {
            handleDefaultError(errorResponse: errorResponse)
        }

    }
    
    private func handleDefaultError(errorResponse: ErrorResponse) {
//        LoadingManager.hideLoadingIndicator()
        let message = "\(errorResponse.errors.first?.title ?? "")\n\(errorResponse.errors.first?.detail ?? "")"
//        AlertHelper.presentAlert(title: .error, message: message)
    }
    
}
