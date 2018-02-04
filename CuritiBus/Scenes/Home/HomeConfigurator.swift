//
//  HomeConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeConfigurator {
    func configure(_ viewController: HomeViewController)
}

class HomeConfigurator: IHomeConfigurator {
    
    func configure(_ viewController: HomeViewController) {
        let router = HomeViewRouter(viewController: viewController)
        let useCase = GetCurrentUserUseCase(authGateway: FirebaseAuthGateway())
        viewController.presenter = HomePresenter(view: viewController, useCase: useCase, router: router)
    }
    
}