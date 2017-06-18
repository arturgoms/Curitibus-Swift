//
//  ILineView.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol ILineView: class {
    
    var presenter: ILinePresenter? { get }
    
    func urbsShapesLoaded(shapes: [UrbsShape])
    func urbsShapesDidFailLoad(error: ErrorResponse?)
    
}
