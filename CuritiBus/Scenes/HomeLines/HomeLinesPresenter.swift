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
    func listLines()
    func listUserLines()
    func numberOfUserLines() -> Int
}

class HomeLinesPresenter: IHomeLinesPresenter {
    
    private weak var view: IHomeLinesView!
    private let linesUseCase: IListLinesUseCase
    private let userLinesUseCase: IListUserLinesUseCase
    private let router: HomeLinesViewRouter
    
    private var lines = [Line]()
    private var userLines = [Line]()
    
    init(view: IHomeLinesView, linesUseCase: IListLinesUseCase, userLinesUseCase: IListUserLinesUseCase, router: HomeLinesViewRouter) {
        self.view = view
        self.linesUseCase = linesUseCase
        self.userLinesUseCase = userLinesUseCase
        self.router = router
    }
    
    func listLines() {
        
        linesUseCase.listLines { result in
            switch result {
            case .success(let lines):
                self.lines = lines
                
            case .failure(let error):
                self.view.showAlert(error.localizedDescription)
            }
        }
        
    }
    
    func listUserLines() {
        
        userLinesUseCase.listUserLines { result in
            switch result {
            case .success(let lines):
                self.userLines = lines
                self.view.refreshLines(lines)
                
            case .failure(let error):
                self.view.showAlert(error.localizedDescription)
            }
        }
        
    }
    
    func numberOfUserLines() -> Int {
        return userLines.count
    }

}
