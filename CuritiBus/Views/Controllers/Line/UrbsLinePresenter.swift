//
//  UrbsLinePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

class UrbsLinePresenter: ILinePresenter {
    
    var view: ILineView?
    var shapeInteractor: ShapeInteractor
    
    required init(shapeInteractor: ShapeInteractor) {
        self.shapeInteractor = shapeInteractor
    }
    
    func loadShapes(line: Line) {
        
        shapeInteractor.getUrbsShapes(line: line, success: { shapes in
            self.view?.urbsShapesLoaded(shapes: shapes)
        }, error: { error in
            self.view?.urbsShapesDidFailLoad(error: error)
        })
        
    }
    
}
