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
    @IBOutlet private weak var sourceIcon: UIImageView!
    @IBOutlet private weak var marginView: UIView!
    
    var line: Line? {
        didSet {
            
            codeLabel.text = line?.cod
            nameLabel.text = line?.name?.capitalized
            categoryLabel.text = line?.categoryName
            
            switch line {
            case is UrbsLine:
                sourceIcon.image = #imageLiteral(resourceName: "curitiba-logo")
                
            case is MetroLine:
                sourceIcon.image = #imageLiteral(resourceName: "metro-logo")
                
            default:
                break
            }
            
            marginView.backgroundColor = line?.type.color
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        UIView.animate(withDuration: 0.15) {
            self.backgroundColor = selected ? UIColor.lightGray.withAlphaComponent(0.2) : UIColor.white
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(withDuration: 0.15) { 
            self.backgroundColor = highlighted ? UIColor.lightGray.withAlphaComponent(0.2) : UIColor.white
        }
    }
    
}
