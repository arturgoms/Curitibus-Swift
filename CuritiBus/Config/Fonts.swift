//
//  Fonts.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 30/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import UIKit

enum AppFont {
    case awesome
}

extension AppFont {
    
    func size(_ size: CGFloat) -> UIFont {
        switch self {
            
        case .awesome:
            return UIFont(name: "FontAwesome", size: size)!
            
        }
    }
}
