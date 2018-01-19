//
//  APIClient.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Alamofire
import CodableAlamofire

// MARK: - APIClient

protocol APIClient {
    func execute<T: Decodable>(endpoint: APIEndpoint, completionHandler: @escaping (Result<T>) -> Void)
}

class APIClientImplementation: APIClient {
    
    func execute<T: Decodable>(endpoint: APIEndpoint, completionHandler: @escaping (Result<T>) -> Void) {
        
        endpoint.request().responseDecodableObject { (response: DataResponse<APIResult<T>>) in

            do {
                let apiResponse = try response.result.unwrap()

                if apiResponse.success, let data = apiResponse.data {
                    completionHandler(.success(data))

                } else if let errorMessage = apiResponse.errorMessage {
                    let error = APIError.remote(message: errorMessage)
                    self.handleError(error: error, completionHandler: completionHandler)

                } else {
                    let unknownError = APIError.unknown(request: response.request, response: response.response)
                    self.handleError(error: unknownError, completionHandler: completionHandler)
                }

            } catch let error {
                self.handleError(error: error, completionHandler: completionHandler)
            }

        }

    }

    private func handleError<T: Decodable>(error: Error, completionHandler: @escaping (Result<T>) -> Void) {
        let failure: Result<T> = .failure(error)
        completionHandler(failure)
    }
    
}
