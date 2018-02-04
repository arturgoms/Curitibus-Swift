//
//  HomeLinesConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeLinesConfigurator {
    func configure(_ viewController: HomeLinesTableViewController)
}

class HomeLinesConfigurator: IHomeLinesConfigurator {
    
    func configure(_ viewController: HomeLinesTableViewController) {
        let router = HomeLinesViewRouter(viewController: viewController)
        let useCase = ListUserLinesUseCase(authGateway: FirebaseAuthGateway(), userLinesGateway: FirebaseUserLinesGateway())
        
        viewController.presenter = HomeLinesPresenter(view: viewController, useCase: useCase, router: router)
    }
    
}
