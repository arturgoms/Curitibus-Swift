//
//  LineGateway.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol LineGateway {
    func getLines(completion: @escaping (_ result: Result<[Line]>) -> Void)
}
