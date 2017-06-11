//
//  LineInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 23/04/17.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class LineInteractor {
    
    let provider = RxMoyaProvider<LineEndpoint>()
    let disposeBag = DisposeBag()
    
    func getAllLines(success:@escaping (_ lines: [Line]) -> Void, error: ((ErrorResponse) -> Void)? = nil) {
        
        let apiObserver = APIObserver<[Line]>(success: { lines in
            
            success(lines)
            
        }, error: error)
        
        provider.request(LineEndpoint.getAllLines)
            .mapArray(Line.self)
            .subscribe(apiObserver)
            .disposed(by: disposeBag)
        
    }
    
}
