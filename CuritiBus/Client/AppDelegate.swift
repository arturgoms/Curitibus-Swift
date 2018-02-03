//
//  AppDelegate.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 18/01/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps
import Simplicity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Init Firebase
        FirebaseApp.configure()
        
        // Init GoogleMaps
        GMSServices.provideAPIKey(Secrets.kGoogleMapsAPIKey)
        
        // Init Twitter
        TWTRTwitter.sharedInstance().start(withConsumerKey: Secrets.kTwitterConsumerKey, consumerSecret: Secrets.kTwitterConsumerSecret)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        if url.absoluteString.prefix(10) == "twitterkit" {
            return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        } else {
            return Simplicity.application(app, open: url, options: options)
        }
    }

}
