//
//  InitialPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IInitialView: class {
    
}

protocol IInitialPresenter {
    func pushFirstView()
}

class InitialPresenter: IInitialPresenter {
    
    private weak var view: IInitialView!
    private let router: InitialViewRouter
    
    init(view: IInitialView, router: InitialViewRouter) {
        self.view = view
        self.router = router
    }

    func pushFirstView() {
        router.presentLoginView()
    }

}
