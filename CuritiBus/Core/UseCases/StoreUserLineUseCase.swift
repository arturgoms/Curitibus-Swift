//
//  StoreUserLineUseCase.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IStoreUserLineUseCase {
    func storeUserLine(line: Line, completion: @escaping (_ result: Result<Void>) -> Void)
}

class StoreUserLineUseCase: IStoreUserLineUseCase {
    
    private let authGateway: AuthGateway
    private let userLinesGateway: UserLinesGateway
    
    init(authGateway: AuthGateway, userLinesGateway: UserLinesGateway) {
        self.authGateway = authGateway
        self.userLinesGateway = userLinesGateway
    }
    
    func storeUserLine(line: Line, completion: @escaping (Result<Void>) -> Void) {
        
        authGateway.getCurrentUser { result in
            switch result {
            case .success(let user):
                self.userLinesGateway.storeUserLine(uid: user.uid, line: line, completion: completion)
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
