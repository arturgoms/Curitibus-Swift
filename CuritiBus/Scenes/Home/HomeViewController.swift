//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, IHomeView {
    
    var configurator: IHomeConfigurator!
    var presenter: IHomePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }

}
