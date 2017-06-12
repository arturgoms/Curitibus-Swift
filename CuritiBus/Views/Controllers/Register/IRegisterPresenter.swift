//
//  IRegisterPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IRegisterPresenter {
    
    weak var view: IRegisterView? { get set }
    
    func facebookSignIn()
    func googleSignIn()
    
}
