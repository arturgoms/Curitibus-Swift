//
//  LoginConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol ILoginConfigurator {
    func configure(_ viewController: LoginViewController)
}

class LoginConfigurator: ILoginConfigurator {

    func configure(_ viewController: LoginViewController) {
        let router = LoginViewRouter(viewController: viewController)
        viewController.presenter = LoginPresenter(view: viewController, useCase: SignInUseCase(authGateway: FirebaseAuthGateway()), router: router)
    }

}
