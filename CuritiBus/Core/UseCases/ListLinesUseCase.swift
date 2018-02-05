//
//  ListLines.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/01/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

protocol IListLinesUseCase {
    func listLines(completion: @escaping (_ user: Result<[Line]>) -> Void)
}

class ListLinesUseCase: IListLinesUseCase {
    
    private let lineGateway: LineGateway
    
    init(lineGateway: LineGateway) {
        self.lineGateway = lineGateway
    }
    
    func listLines(completion: @escaping (Result<[Line]>) -> Void) {
        lineGateway.getLines(completion: completion)
    }

}
