//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    let lineInteractor = LineInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineInteractor.getAllLines(success: { (lines) in
            print(lines)
        })
        
        
    }
    
    @IBAction func logout() {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            
        }
        
    }

}
