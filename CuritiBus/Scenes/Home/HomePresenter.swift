//
//  HomePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IHomeView: class {
    
}

protocol IHomePresenter {
    
}

class HomePresenter: IHomePresenter {
    
    private weak var view: IHomeView!
    private let useCase: IGetCurrentUserUseCase
    private let router: HomeViewRouter
    
    init(view: IHomeView, useCase: IGetCurrentUserUseCase, router: HomeViewRouter) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }

}
