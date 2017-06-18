//
//  ILinePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol ILinePresenter {
    
    weak var view: ILineView? { get set }
    var shapeInteractor: ShapeInteractor { get }
    
    init(shapeInteractor: ShapeInteractor)
    func loadShapes(line: Line)
    
}
