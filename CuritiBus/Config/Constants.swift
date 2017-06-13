//
//  Constants.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import Foundation

func DLog(_ msg: String?) {
    
    guard let msg = msg else { return }
    
    #if DEBUG
        print(msg)
    #else
        CLSLogv(msg, getVaList([]))
    #endif
    
}
