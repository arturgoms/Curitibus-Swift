//
//  UserLineCell.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 14/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class UserLineCell: UITableViewCell {

    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var marginView: UIView!
    @IBOutlet private weak var busIcon: UIImageView! {
        didSet {
            busIcon.image = #imageLiteral(resourceName: "bus_fill").withRenderingMode(.alwaysTemplate)
        }
    }
    
    var line: Line? {
        didSet {
            
            if let line = line as? UrbsLine {
                codeLabel.text = line.cod
                nameLabel.text = line.name
                categoryLabel.text = line.categoryName
                marginView.backgroundColor = line.type.color
                busIcon.tintColor = line.type.color
                backgroundColor = line.type.color.withAlphaComponent(0.05)
                
            } else if let line = line as? MetroLine {
                codeLabel.text = line.cod
                nameLabel.text = line.name
                
            }
            
        }
    }
    
}
