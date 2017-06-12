//
//  IEmailPresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

enum EmailViewType {
    case signUp
    case signIn
}

protocol IEmailPresenter {
    
    weak var view: IEmailView? { get set }
    
    func viewType() -> EmailViewType
    func authenticate(email: String, password: String)
    func recover(email: String)
    
}
