//
//  Secrets.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation

private var source: [String: String] = {
    let path = Bundle.main.path(forResource: "Secrets", ofType: "plist")!
    let secrets = NSDictionary(contentsOfFile: path) as? [String: String]
    return secrets ?? [:]
}()

private let dummy = "qwertyuiop"

struct Secrets {
    static let kGoogleMapsAPIKey        = source["GOOGLE_MAPS_API_KEY"] ?? dummy
    static let kTwitterConsumerKey      = source["TWITTER_CONSUMER_KEY"] ?? dummy
    static let kTwitterConsumerSecret   = source["TWITTER_CONSUMER_SECRET"] ?? dummy
    static let kApiBaseUrl              = source["API_BASE_URL"] ?? dummy
    static let kApiDevBaseUrl           = source["API_DEV_BASE_URL"] ?? dummy
}
