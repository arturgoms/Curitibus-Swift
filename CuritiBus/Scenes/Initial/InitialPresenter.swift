//
//  InitialPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol InitialView: class {
    
}

protocol InitialPresenter {
    func pushFirstView()
}

class InitialPresenterImplementation: InitialPresenter {
    
    weak var view: InitialView?
    let listLinesUseCase: ListLinesUseCase
    let router: InitialViewRouter
    
    init(view: InitialView, listLinesUseCase: ListLinesUseCase, router: InitialViewRouter) {
        self.view = view
        self.listLinesUseCase = listLinesUseCase
        self.router = router
    }

    func pushFirstView() {
        
    }

}
