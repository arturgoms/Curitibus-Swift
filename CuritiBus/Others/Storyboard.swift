//
//  Storyboard.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 01/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main
    
    var fileName: String {
        return String(rawValue.prefix(1).uppercased()) + rawValue.dropFirst()
    }
}

extension Storyboard {
    
    func instantiate<T>(_ viewClass: T.Type) -> T {
        return instantiate(String(describing: viewClass), type: T.self)
    }
    
    func instantiate<T>(_ identifier: String, type: T.Type) -> T {
        // swiftlint:disable force_cast
        return UIStoryboard(name: fileName, bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as! T
        // swiftlint:enable force_cast
    }
    
}
