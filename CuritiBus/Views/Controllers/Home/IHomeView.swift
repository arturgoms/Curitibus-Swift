//
//  IHomeView.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeView: class {
    
    var presenter: IHomePresenter? { get }
    
    func userLinesDidLoad(lines: [Line])
    func userLinesLoadDidFail(error: Error?)
    
}
