//
//  LocalizedString.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 16/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localizedWithArgs(args: CVarArg...) -> String {
        return String(format: self.localized, arguments: args)
    }
}
