//
//  UserLinesManager.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 14/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

class UserLinesManager {
    
    static var urbsLines: [UrbsLine] = [UrbsLine]()
    static var metroLines: [MetroLine] = [MetroLine]()
    static var allLines: [Line] = [Line]()
    
    static var userLines: [Line] = [Line]()
    
    class func merge() {
        allLines = (urbsLines as [Line] + metroLines as [Line]).sorted(by: { $0.name! < $1.name! })
    }
    
}
