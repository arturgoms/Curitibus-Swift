//
//  HomeViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeViewRouter {
    func openLine(_ line: Line)
}

class HomeViewRouter: IHomeViewRouter {
    
    private weak var viewController: HomeViewController!
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
    func openLine(_ line: Line) {
        let lineViewController = Storyboard.main.instantiate(LineViewController.self)
        lineViewController.configurator = LineConfigurator(line: line)
        
        viewController.show(lineViewController, sender: viewController)
    }
    
}
