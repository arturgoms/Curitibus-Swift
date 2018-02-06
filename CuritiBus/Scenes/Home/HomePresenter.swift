//
//  HomePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IHomeView: class {
    func refreshUserLines(_ lines: [Line])
    func refreshFilter(_ lines: [Line])
    func showAlert(_ message: String)
}

protocol IHomePresenter {
    func listLines()
    func listUserLines()
    func numberOfUserLines() -> Int
    func numberOfSearchLines() -> Int
    func search(_ query: String?)
}

class HomePresenter: IHomePresenter {
    
    private weak var view: IHomeView!
    private let linesUseCase: IListLinesUseCase
    private let userLinesUseCase: IListUserLinesUseCase
    private let router: HomeViewRouter
    
    init(view: IHomeView, linesUseCase: IListLinesUseCase, userLinesUseCase: IListUserLinesUseCase, router: HomeViewRouter) {
        self.view = view
        self.linesUseCase = linesUseCase
        self.userLinesUseCase = userLinesUseCase
        self.router = router
    }
    
    private var lines = [Line]()
    private var userLines = [Line]()
    private var searchQuery: String?
    
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
                self.view.refreshUserLines(lines)

            case .failure(let error):
                self.view.showAlert(error.localizedDescription)
            }
        }
        
    }
    
    func numberOfUserLines() -> Int {
        return searchQuery == nil ? userLines.count : 0
    }
    
    func numberOfSearchLines() -> Int {
        return searchQuery == nil ? 0 : lines.count
    }
    
    func search(_ query: String?) {
        self.searchQuery = query
        view.refreshFilter(lines)
    }

}
