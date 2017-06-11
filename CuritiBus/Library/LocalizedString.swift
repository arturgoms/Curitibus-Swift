//
//  LocalizedString.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 27/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(args: CVarArg...) -> String {
        return String(format: self.localized, arguments:args)
    }
}
