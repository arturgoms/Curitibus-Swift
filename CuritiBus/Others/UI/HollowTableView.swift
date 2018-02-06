//
//  HollowTableView.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 05/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HollowTableView: UITableView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if indexPathForRow(at: point) != nil {
            return super.hitTest(point, with: event)
        }
        return nil
    }
    
}
