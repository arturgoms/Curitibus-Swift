//
//  AppDelegate.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 18/01/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Init Firebase
        FirebaseApp.configure()
        
        return true
    }

}
