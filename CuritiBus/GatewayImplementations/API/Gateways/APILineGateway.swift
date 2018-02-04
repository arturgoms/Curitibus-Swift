//
//  APILineGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

class APILineGateway: LineGateway {
    
    let apiClient: IAPIClient
    
    init(apiClient: IAPIClient) {
        self.apiClient = apiClient
    }
    
    func getLines(completion: @escaping (Result<[Line]>) -> Void) {
        let endpoint = ListLinesEndpoint()
        apiClient.execute(endpoint: endpoint, completionHandler: completion)
    }
    
}
