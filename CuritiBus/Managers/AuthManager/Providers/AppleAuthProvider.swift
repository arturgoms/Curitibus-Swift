//
//  AppleAuthProvider.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import AuthenticationServices

struct AppleAuthProvider: AuthProvider {
    
    func hasSession(handler: @escaping (Bool) -> Void) {
        
        guard #available(iOS 13.0, *), let userID = ASAuthorizationAppleIDCredential.savedID else {
            handler(false)
            return
        }
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userID) { credentialState, error in
            switch credentialState {
            case .authorized:
                handler(true)
            case .revoked:
                handler(false)
            case .notFound:
                handler(false)
            default:
                handler(false)
            }
        }
        
    }
    
    func logout() {
        if #available(iOS 13.0, *) {
            ASAuthorizationAppleIDCredential.remove()
        }
    }
    
}

@available(iOS 13.0, *)
extension ASAuthorizationAppleIDCredential {
    
    static var savedID: String? {
        return UserDefaults.standard.string(forKey: "apple_provider_id")
    }
    
    var savedName: String? {
        return UserDefaults.standard.string(forKey: "apple_provider_name")
    }
    
    var savedEmail: String? {
        return UserDefaults.standard.string(forKey: "apple_provider_email")
    }
    
    func save() {
        UserDefaults.standard.set(fullName?.givenName, forKey: "apple_provider_name")
        UserDefaults.standard.set(email, forKey: "apple_provider_email")
        UserDefaults.standard.synchronize()
    }
    
    static func remove() {
        UserDefaults.standard.removeObject(forKey: "apple_provider_id")
        UserDefaults.standard.synchronize()
    }
    
}
