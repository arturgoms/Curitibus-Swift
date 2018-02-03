//
//  LoginPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ILoginView: class {
    func showAlert(_ message: String)
}

protocol ILoginPresenter {
    func signIn(_ provider: AuthProvider)
}

class LoginPresenter: ILoginPresenter {

    private weak var view: ILoginView!
    private let useCase: ISignInUseCase
    private let router: ILoginViewRouter

    init(view: ILoginView, useCase: ISignInUseCase, router: ILoginViewRouter) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }
    
    func signIn(_ provider: AuthProvider) {
        useCase.signIn(provider) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                self.view.showAlert(error.localizedDescription)
            }
        }
    }

}
