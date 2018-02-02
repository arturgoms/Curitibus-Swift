//
//  LoginPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ILoginView: class {

}

protocol ILoginPresenter {

}

class LoginPresenter: ILoginPresenter {

    weak var view: ILoginView!
    let router: ILoginViewRouter

    init(view: ILoginView, router: ILoginViewRouter) {
        self.view = view
        self.router = router
    }

}
