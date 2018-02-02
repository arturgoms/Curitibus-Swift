//
//  FlatButton.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 02/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class FlatButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.white.withAlphaComponent(0.15).cgColor
    }

}
