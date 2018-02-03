//
//  UIViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 25/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @IBAction func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func showAlert(_ message: String) {
        let alertContoller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertContoller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertContoller, animated: true, completion: nil)
    }
    
}
