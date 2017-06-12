//
//  IEmailView.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IEmailView: class {
    
    var presenter: IEmailPresenter? { get }
    
    func userDidAuthenticate()
    func userAuthenticationDidFail(error: Error?)
    
}
