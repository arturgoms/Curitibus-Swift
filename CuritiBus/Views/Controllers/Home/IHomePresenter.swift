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
    var stopInteractor: StopInteractor { get }
    var shapeInteractor: ShapeInteractor { get }
    
    init(lineInteractor: LineInteractor, stopInteractor: StopInteractor, shapeInteractor: ShapeInteractor)
    func loadUserLines()
    func addUserLine(line: Line)
    func deleteUserLine(line: Line)
    func getLineStops(line: Line)
    func getLinePaths(line: Line)
    func getLineShapes(line: Line)
    
}
