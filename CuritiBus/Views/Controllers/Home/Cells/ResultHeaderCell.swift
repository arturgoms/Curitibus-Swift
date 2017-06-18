//
//  ResultHeaderCell.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class ResultHeaderCell: UITableViewCell {
    
    @IBOutlet private weak var searchTextLabel: UILabel!

    func setSearchText(_ text: String) {
        searchTextLabel.text = "Resultados para: \(text)"
    }

}
