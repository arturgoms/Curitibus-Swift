//
//  LineConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol ILineConfigurator {
    func configure(_ viewController: LineViewController)
}

class LineConfigurator: ILineConfigurator {
    
    private let line: Line
    
    init(line: Line) {
        self.line = line
    }

    func configure(_ viewController: LineViewController) {
        let router = LineViewRouter(viewController: viewController)
        let useCase = StoreUserLineUseCase(authGateway: FirebaseAuthGateway(), userLinesGateway: FirebaseUserLinesGateway())
        
        viewController.presenter = LinePresenter(view: viewController, useCase: useCase, line: line, router: router)
    }

}
