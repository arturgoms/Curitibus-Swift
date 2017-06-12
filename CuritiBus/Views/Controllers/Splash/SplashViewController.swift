//
//  SplashViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.navigate(.home)
        } else {
            self.navigate(.register(RegisterPresenter()))
        }
        
    }
    
}
