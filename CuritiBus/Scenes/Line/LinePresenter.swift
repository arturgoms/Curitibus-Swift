//
//  LinePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ILineView: class {
    func didFavoriteLine()
    func didUnfavoriteLine()
    func showAlert(_ message: String)
}

protocol ILinePresenter {
    func favorite()
}

class LinePresenter: ILinePresenter {

    weak var view: ILineView!
    private let useCase: IStoreUserLineUseCase
    private let line: Line
    let router: ILineViewRouter

    init(view: ILineView, useCase: IStoreUserLineUseCase, line: Line, router: ILineViewRouter) {
        self.view = view
        self.useCase = useCase
        self.line = line
        self.router = router
    }
    
    func favorite() {
        useCase.storeUserLine(line: line) { result in
            switch result {
            case .success:
                self.view.didFavoriteLine()
            case .failure(let error):
                self.view.showAlert(error.localizedDescription)
            }
        }
    }

}
