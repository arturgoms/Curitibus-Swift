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
    func configureUserLine(_ cell: HomeLineCell, _ indexPath: IndexPath)
    func configureSearchLine(_ cell: HomeLineCell, _ indexPath: IndexPath)
    func didSelect(_ indexPath: IndexPath)
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
    
    private var allLines = [Line]()
    private var filterLines = [Line]()
    
    private var userLines = [Line]()
    private var searchQuery: String?
    
    func listLines() {
        
        linesUseCase.listLines { result in
            switch result {
            case .success(let lines):
                self.allLines = lines

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
        return searchQuery == nil ? 0 : filterLines.count
    }
    
    func search(_ query: String?) {
        self.searchQuery = query
        if query == nil || query?.isEmpty == true {
            filterLines = allLines
        } else {
            filterLines = allLines.filter({ $0.name.lowercased().contains(query!) })
        }
        
        view.refreshFilter(filterLines)
    }
    
    func configureUserLine(_ cell: HomeLineCell, _ indexPath: IndexPath) {
        cell.line = userLines[indexPath.row]
    }
    
    func configureSearchLine(_ cell: HomeLineCell, _ indexPath: IndexPath) {
        cell.line = filterLines[indexPath.row]
    }
    
    func didSelect(_ indexPath: IndexPath) {
        if searchQuery == nil {
            router.openLine(userLines[indexPath.row])
        } else {
            router.openLine(filterLines[indexPath.row])
        }
    }

}
