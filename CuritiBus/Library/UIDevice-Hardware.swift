//
//  UIDevice-Hardware.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
    var userAgent: String {
        
        let infoDictionary = Bundle.main.infoDictionary
        let majorVersion = infoDictionary?["CFBundleShortVersionString"] as! String
        let minorVersion = infoDictionary?["CFBundleVersion"] as! String
        let userAgent = "CuritiBus-iOS/\(majorVersion) (build \(minorVersion))"
        
        return userAgent
        
    }
    
}
