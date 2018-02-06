//
//  HomeResultLineCell.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeResultLineCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var line: Line? {
        didSet {
            nameLabel.text = line?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
