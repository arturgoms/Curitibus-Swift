//
//  LoginPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import Foundation

protocol ILoginView: class {
    func loginFailure(error: Error)
}

protocol ILoginPresenter {
    func checkAuth()
    func presentHome()
}

class LoginPresenter: NSObject, ILoginPresenter {
    
    weak var view: ILoginView?
    private let useCaseFactory: IUseCaseFactory
    private let routerFactory: IRouterFactory
    
    internal init(view: ILoginView?, useCaseFactory: IUseCaseFactory, routerFactory: IRouterFactory) {
        self.view = view
        self.useCaseFactory = useCaseFactory
        self.routerFactory = routerFactory
    }
    
    func checkAuth() {
        AuthManager.shared.hasSession { logged in
            if logged {
                self.presentHome()
            } else {
                print("nao tem sessao")
            }
        }
    }
    
    func presentHome() {
        routerFactory.createHomeViewRouter().navigateTo()
    }
    
    func signInWith(provider: SignInProvider, providerID: String, name: String, email: String) {
        useCaseFactory.createSignInUseCase().signIn(provider: provider, providerID: providerID, name: name, email: email) { result in
            switch result {
            case .success:
                self.presentHome()
            case .failure(let error):
                self.view?.loginFailure(error: error)
            }
        }
    }

}
