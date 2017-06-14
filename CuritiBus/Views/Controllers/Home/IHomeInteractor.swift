//
//  IHomeInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeInteractor {
    
    weak var view: IHomeView? { get set }
    
    func loadUserLines()
//    func viewType() -> EmailViewType
//    func authenticate(email: String, password: String)
//    func recover(email: String)
    
}
