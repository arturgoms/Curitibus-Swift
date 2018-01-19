//
//  Codability.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 18/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation

protocol Codability: Codable {}

extension Codability {
    typealias T = Self
    
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func encodeToJson() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            return nil
        }
    }
    
    static func decode(data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
