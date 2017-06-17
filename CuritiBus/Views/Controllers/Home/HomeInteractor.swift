//
//  HomeInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

class HomePresenter: IHomePresenter {
    
    weak var view: IHomeView?
    var lineInteractor: LineInteractor
    
    required init(lineInteractor: LineInteractor) {
        self.lineInteractor = lineInteractor
    }
    
    func loadUserLines() {
        lineInteractor.getUserLines(success: { lines in
            self.view?.userLinesDidLoad(lines: lines)
        }, error: { error in
            self.view?.userLinesLoadDidFail(error: error)
        })
    }
    
    func deleteUserLine(line: Line) {
        lineInteractor.deleteUserLine(line: line)
    }
    
}
