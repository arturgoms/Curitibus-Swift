//
//  IRegisterView.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IRegisterView: class {
    
    var presenter: IRegisterPresenter? { get }
    
    func userDidLogin()
    func userLoginDidFail(error: Error?)
    
}
