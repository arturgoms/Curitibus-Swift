//
//  SignInUseCase.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

enum AuthProvider {
    case facebook, google, twitter
}

protocol ISignInUseCase {
    func signIn(_ provider: AuthProvider, completion: @escaping (_ result: Result<Void>) -> Void)
}

class SignInUseCase: ISignInUseCase {
    
    private let authGateway: AuthGateway
    
    init(authGateway: AuthGateway) {
        self.authGateway = authGateway
    }
    
    func signIn(_ provider: AuthProvider, completion: @escaping (Result<Void>) -> Void) {
        switch provider {
        case .facebook:
            authGateway.facebookSignIn(completion: completion)
            
        case .google:
            authGateway.googleSignIn(completion: completion)
            
        case .twitter:
            authGateway.twitterSignIn(completion: completion)
        }
    }
    
}
