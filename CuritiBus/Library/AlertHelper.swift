//
//  UIDevice-Hardware.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 27/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import UIKit

enum AlertTitle: String {
    case warning = "ALERT_WARNING_TITLE"
    case error = "ALERT_ERROR_TITLE"
}

class AlertHelper {
    
    class func presentAlert(title: AlertTitle = .warning, message: String, sender: UIViewController? = Storyboard.currentViewController()) {
        let alertController = UIAlertController(title: title.rawValue.localized, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ALERT_OK_TITLE".localized, style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        sender?.present(alertController, animated: true, completion: nil)
    }
    
}
