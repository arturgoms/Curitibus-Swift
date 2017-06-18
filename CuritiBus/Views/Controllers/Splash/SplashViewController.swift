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
    
    private let lineInteractor = LineInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lineInteractor.getUrbsLines(success: { urbsLines in
            
            UserLinesManager.urbsLines = urbsLines
            if UserLinesManager.metroLines.count > 0 {
                self.autoLogin()
            }
            
        }, error: { error in
            AlertHelper.presentAlert(title: .error, message: error.message ?? "", sender: self)
        })
        
        lineInteractor.getMetroLines(success: { metroLines in
            
            UserLinesManager.metroLines = metroLines
            if UserLinesManager.urbsLines.count > 0 {
                self.autoLogin()
            }
            
        }, error: { error in
            AlertHelper.presentAlert(title: .error, message: error.message ?? "", sender: self)
        })
        
    }
    
    func autoLogin() {
        UserLinesManager.merge()
        
        if Auth.auth().currentUser != nil {
            self.navigate(.home(HomePresenter(lineInteractor: LineInteractor(), stopInteractor: StopInteractor(), shapeInteractor: ShapeInteractor()), MapPresenter()))
        } else {
            self.navigate(.register(RegisterPresenter()))
        }
    }
    
}
