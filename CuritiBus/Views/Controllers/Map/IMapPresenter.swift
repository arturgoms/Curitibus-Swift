//
//  IMapPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IMapPresenter {
    
    weak var view: IMapView? { get set }
//    var lineInteractor: LineInteractor { get }
//    var stopInteractor: StopInteractor { get }
//    
//    init(lineInteractor: LineInteractor, stopInteractor: StopInteractor)
    
}
