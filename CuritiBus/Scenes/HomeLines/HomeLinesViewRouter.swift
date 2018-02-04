//
//  HomeLinesViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeLinesViewRouter {
}

class HomeLinesViewRouter: IHomeLinesViewRouter {
    
    private weak var viewController: HomeLinesTableViewController!
    
    init(viewController: HomeLinesTableViewController) {
        self.viewController = viewController
    }
    
}
