//
//  InitialViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 10/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, IInitialView {
    
    let configurator = InitialConfigurator()
    var presenter: IInitialPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        presenter.pushFirstView()
    }

}
