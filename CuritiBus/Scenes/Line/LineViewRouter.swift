//
//  LineViewRouter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ILineViewRouter {

}

class LineViewRouter: ILineViewRouter {

    private weak var viewController: LineViewController!

    init(viewController: LineViewController) {
        self.viewController = viewController
    }

}
