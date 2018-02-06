//
//  HomeUserLineCell.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeUserLineCell: UITableViewCell {
    
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
