//
//  HomeConfigurator.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeConfigurator {
    func configure(_ viewController: HomeViewController)
}

struct HomeConfigurator: IHomeConfigurator {
    
    func configure(_ viewController: HomeViewController) {
        viewController.presenter = HomePresenter(view: viewController)
    }
    
}
