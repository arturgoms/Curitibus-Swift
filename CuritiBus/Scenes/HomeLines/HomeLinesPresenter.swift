//
//  HomeLinesPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IHomeLinesView: class {
    func refreshLines(_ lines: [Line])
    func showAlert(_ message: String)
}

protocol IHomeLinesPresenter {
    func listUserLines()
    func numberOfLines() -> Int
}

class HomeLinesPresenter: IHomeLinesPresenter {
    
    private weak var view: IHomeLinesView!
    private let useCase: IListUserLinesUseCase
    private let router: HomeLinesViewRouter
    
    private var lines = [Line]()
    
    init(view: IHomeLinesView, useCase: IListUserLinesUseCase, router: HomeLinesViewRouter) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }
    
    func listUserLines() {
        
        useCase.listUserLines { result in
            switch result {
            case .success(let lines):
                self.lines = lines
                self.view.refreshLines(lines)
                
            case .failure(let error):
                self.view.showAlert(error.localizedDescription)
            }
        }
        
    }
    
    func numberOfLines() -> Int {
        return lines.count
    }

}
