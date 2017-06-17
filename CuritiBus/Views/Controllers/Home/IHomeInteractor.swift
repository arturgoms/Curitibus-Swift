//
//  IHomePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IHomePresenter {
    
    weak var view: IHomeView? { get set }
    var lineInteractor: LineInteractor { get }
    
    init(lineInteractor: LineInteractor)
    func loadUserLines()
    func deleteUserLine(line: Line)
    
}
