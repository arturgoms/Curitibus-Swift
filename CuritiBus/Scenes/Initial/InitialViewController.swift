//
//  InitialViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, InitialView {
    
    let configurator = InitialConfiguratorImplementation()
    var presenter: InitialPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
