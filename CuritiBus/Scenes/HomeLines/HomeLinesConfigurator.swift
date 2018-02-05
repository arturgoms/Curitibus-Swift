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
        let linesUseCase = ListLinesUseCase(lineGateway: APILineGateway(apiClient: APIClient()))
        let userLinesUseCase = ListUserLinesUseCase(authGateway: FirebaseAuthGateway(), userLinesGateway: FirebaseUserLinesGateway())
        
        viewController.presenter = HomeLinesPresenter(view: viewController, linesUseCase: linesUseCase, userLinesUseCase: userLinesUseCase, router: router)
    }
    
}
