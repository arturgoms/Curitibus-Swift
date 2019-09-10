//
//  LoginViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 08/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ILoginViewRouter {
    func set()
}

struct LoginViewRouter: ILoginViewRouter {
    
    private(set) weak var navigationController: UINavigationController?

    func set() {
        let view = Storyboard.main.instantiate(LoginViewController.self)
        view.configurator = LoginConfigurator()
        navigationController?.pushViewController(view, animated: true)
    }

}
