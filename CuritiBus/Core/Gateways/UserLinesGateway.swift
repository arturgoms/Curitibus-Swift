//
//  UserLinesGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 04/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol UserLinesGateway {
    func listUserLines(uid: String, completion: @escaping (_ result: Result<[Line]>) -> Void)
    func storeUserLine(uid: String, line: Line, completion: @escaping (_ result: Result<Void>) -> Void)
}
