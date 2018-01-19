//
//  APILinesGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation

class APILinesGateway: LinesGateway {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
//    func listLines(parameters: ListLinesRequest, completion: @escaping (_ charge: Result<[Line]>) -> Void) {
//
//        let endpoint = ListLinesEndpoint(parameter: parameters)
//        apiClient.execute(endpoint: endpoint) { (result: Result<LinesContainer>) in
//
//            switch result {
//            case .success(let linesContainer):
//                completion(.success(linesContainer.lines))
//
//            case .failure(let error):
//                completion(.failure(error))
//            }
//
//        }
//
//    }
    
}
