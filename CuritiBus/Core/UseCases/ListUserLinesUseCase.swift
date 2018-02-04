//
//  ListUserLinesUseCase.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IListUserLinesUseCase {
    func listUserLines(completion: @escaping (_ user: Result<[Line]>) -> Void)
}

class ListUserLinesUseCase: IListUserLinesUseCase {
    
    private let authGateway: AuthGateway
    private let userLinesGateway: UserLinesGateway
    
    init(authGateway: AuthGateway, userLinesGateway: UserLinesGateway) {
        self.authGateway = authGateway
        self.userLinesGateway = userLinesGateway
    }
    
    func listUserLines(completion: @escaping (Result<[Line]>) -> Void) {
        
        authGateway.getCurrentUser { result in
            switch result {
            case .success(let user):
                self.userLinesGateway.listUserLines(uid: user.uid, completion: completion)
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
