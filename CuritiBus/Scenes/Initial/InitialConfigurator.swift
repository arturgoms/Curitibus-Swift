//
//  InitialConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol InitialConfigurator {
    func configure(_ viewController: InitialViewController)
}

class InitialConfiguratorImplementation: InitialConfigurator {
    
    func configure(_ viewController: InitialViewController) {
//        let router = InitialViewRouterImplementation()
//        let userCase = GetStoredUserUseCaseImplementation(userGateway: UserDefaultsUserGateway())
//        
//        viewController.presenter = InitialPresenterImplementation(view: viewController, getStoredUserUseCase: userCase, router: router)
    }
    
}
