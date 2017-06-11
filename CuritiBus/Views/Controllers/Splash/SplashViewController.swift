//
//  SplashViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    let interactor = LineInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.getAllLines(success: { lines in
            print("aaa")
        }) { (error) in
            print(error)
        }
    }

}
