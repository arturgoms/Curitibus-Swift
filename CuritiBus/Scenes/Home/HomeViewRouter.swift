//
//  HomeViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IHomeViewRouter {
    func navigateTo()
}

struct HomeViewRouter: IHomeViewRouter {
    
    private(set) weak var navigationController: UINavigationController?

    func navigateTo() {
        let viewController = Storyboard.main.instantiate(HomeViewController.self)
        viewController.configurator = HomeConfigurator()
        navigationController?.setViewControllers([viewController], animated: true)
    }

}
