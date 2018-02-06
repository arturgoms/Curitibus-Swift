//
//  HomeLineSearchCell.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol LineSearchDelegate: class {
    func expandSearch()
    func collapseSearch()
}

class HomeLineSearchCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet private weak var searchBar: UITextField!
    weak var delegate: LineSearchDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - UITextFieldDelegate
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        delegate?.expandSearch()
//        return true
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.expandSearch()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        delegate?.collapseSearch()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
