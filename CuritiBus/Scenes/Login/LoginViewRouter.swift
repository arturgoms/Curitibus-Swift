//
//  LoginViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ILoginViewRouter {

}

class LoginViewRouter: ILoginViewRouter {

    private weak var viewController: LoginViewController!

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

}
