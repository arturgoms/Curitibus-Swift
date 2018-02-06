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
    func search(_ query: String?)
}

class HomeLineSearchCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet private weak var searchBar: UITextField!
    weak var delegate: LineSearchDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delegate?.expandSearch()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        delegate?.collapseSearch()
        textField.text = nil
        delegate?.search(nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        delegate?.search(textField.text)
    }

}
