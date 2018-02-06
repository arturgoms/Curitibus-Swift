//
//  UITableView.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
        // swiftlint:enable force_cast
    }
    
}
