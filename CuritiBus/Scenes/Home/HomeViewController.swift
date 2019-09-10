//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, IHomeView {
    
    var configurator: IHomeConfigurator!
    var presenter: IHomePresenter!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }
    
    @IBAction private func logout() {
        AuthManager.shared.logout()
        RouterFactory(navigationController: navigationController).createLoginViewRouter().set()
    }
    
}
