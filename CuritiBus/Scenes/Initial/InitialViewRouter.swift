//
//  InitialViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IInitialViewRouter {
    func presentLoginView()
    func presentHomeView()
}

class InitialViewRouter: IInitialViewRouter {
    
    private weak var viewController: InitialViewController!
    
    init(viewController: InitialViewController) {
        self.viewController = viewController
    }
    
    func presentLoginView() {
        let loginView = Storyboard.main.instantiate(LoginViewController.self)
        loginView.configurator = LoginConfigurator()
        
        viewController.navigationController?.setViewControllers([loginView], animated: false)
    }
    
    func presentHomeView() {
        let homeView = Storyboard.main.instantiate(HomeViewController.self)
        homeView.configurator = HomeConfigurator()
        
        viewController.navigationController?.setViewControllers([homeView], animated: false)
    }
    
}
