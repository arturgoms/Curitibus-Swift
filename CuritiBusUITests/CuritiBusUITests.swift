//
//  CuritiBusUITests.swift
//  CuritiBusUITests
//
//  Created by Diego Trevisan Lara on 18/01/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import XCTest

class CuritiBusUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
