//
//  APIResult.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 12/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

struct APIResult<T: Decodable>: Decodable {
    var success: Bool
    var data: T?
    var errorMessage: String?
}
