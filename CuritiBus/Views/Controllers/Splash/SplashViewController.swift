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
    
    let lineInteractor = LineInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lineInteractor.getAllLines(success: { lines in
            
            UserLinesManager.urbsLines = lines
            self.autoLogin()
            
        }, error: { error in
            AlertHelper.presentAlert(title: .error, message: error.message ?? "", sender: self)
        })
        
    }
    
    func autoLogin() {
        if Auth.auth().currentUser != nil {
            self.navigate(.home(HomePresenter(lineInteractor: LineInteractor())))
        } else {
            self.navigate(.register(RegisterPresenter()))
        }
    }
    
}
