//
//  AppNavigation.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 28/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

enum NavigationRoute: Navigation {
    case register(IRegisterPresenter)
    case email(IEmailPresenter)
    case home(IHomePresenter, IMapPresenter)
}

struct CuritibusNavigation: AppNavigation {
    
    func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? NavigationRoute {
            
            switch navigation {
                
            case .register(let presenter):
                let vc = Storyboard.instantiate(RegisterViewController.self)
                vc.presenter = presenter
                return vc
                
            case .email(let presenter):
                let vc = Storyboard.instantiate(EmailViewController.self)
                vc.presenter = presenter
                return vc
                
            case .home(let homePresenter, let mapPresenter):
                let tabBarController = Storyboard.instantiate("MainTabBarController") as! UITabBarController
                
                var navigationController = tabBarController.viewControllers?[0] as! UINavigationController
                let home = navigationController.viewControllers.first as! HomeViewController
                home.presenter = homePresenter
                
                navigationController = tabBarController.viewControllers?[1] as! UINavigationController
                let map = navigationController.viewControllers.first as! MapViewController
                map.presenter = mapPresenter
                
                return tabBarController
                
            }
        }
        return UIViewController()
    }
    
    func navigate(_ navigation: Navigation, from: UIViewController?, to: UIViewController) {
        
        switch (from, to) {
            
        case (_, is UITabBarController):
            to.setRoot()
            
        case (_, is UINavigationController):
            to.modal()
//
//        // Navegações provenientes do menu lateral validam antes se aquela view já não está aberta
//        case (is MenuViewController, let to):
//            if let currentView = Storyboard.currentViewController(), type(of: currentView) != type(of: to) {
//                to.setRoot()
//            }
//            
//        case (is LoginViewController, is RegisterViewController),
//             (is RegisterViewController, is LoginViewController):
//            to.replaceLast(flips: true)
            
        default:
            from?.navigationController?.pushViewController(to, animated: true)
            
        }
        
    }
    
}

extension UIViewController {
    
    func navigate(_ navigation: NavigationRoute) {
        navigate(navigation as Navigation)
    }
    
}
