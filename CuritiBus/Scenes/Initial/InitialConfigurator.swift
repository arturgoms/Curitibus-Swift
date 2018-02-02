//
//  InitialConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IInitialConfigurator {
    func configure(_ viewController: InitialViewController)
}

class InitialConfigurator: IInitialConfigurator {
    
    func configure(_ viewController: InitialViewController) {
        let router = InitialViewRouter(viewController: viewController)
        viewController.presenter = InitialPresenter(view: viewController, router: router)
    }
    
}
