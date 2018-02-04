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
    private let useCase: IGetCurrentUserUseCase
    private let router: InitialViewRouter
    
    init(view: IInitialView, useCase: IGetCurrentUserUseCase, router: InitialViewRouter) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }

    func pushFirstView() {
        useCase.getCurrentUser { result in
            switch result {
            case .success:
                self.router.presentHomeView()
            case .failure:
                self.router.presentLoginView()
            }
        }
    }

}
