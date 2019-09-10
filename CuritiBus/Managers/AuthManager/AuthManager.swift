//
//  AuthManager.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import Foundation

protocol IAuthManager {
    func hasSession(handler: @escaping (Bool) -> Void)
    func logout()
}

struct AuthManager: IAuthManager {
    
    static var shared: IAuthManager = AuthManager(providers: [AppleAuthProvider(), FacebookAuthProvider()])
    private let providers: [AuthProvider]
    
    func hasSession(handler: @escaping (Bool) -> Void) {
        var count: Int = 0
        var logged: Bool = false
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        
        providers.forEach { provider in
            provider.hasSession { isLogged in
                logged = logged || isLogged
                count += 1
                
                if count == self.providers.count {
                    semaphore.signal()
                }
            }
        }
        
        semaphore.wait()
        handler(logged)
    }
    
    func logout() {
        providers.forEach({ $0.logout() })
    }
    
}

protocol AuthProvider: IAuthManager {}
