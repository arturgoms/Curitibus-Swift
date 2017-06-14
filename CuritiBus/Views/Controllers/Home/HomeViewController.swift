//
//  HomeViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 11/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, IHomeView {
    
    var presenter: IHomeInteractor? {
        didSet {
            presenter?.view = self
        }
    }
    
    let x = LineInteractor()
    
    //MARK: - UIView Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        x.getAllLines(success: { (lines) in
            
            let line = lines.first
            self.x.addUserLine(line: line!, success: {
                
                print("OK")
                
            }, error: { (error) in
                
                print(error)
                
            })
            
        }, error: { (error) in
            
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - IB Actions
    
    
    
    //MARK: - IHomeInteractor
    
    func userLinesDidLoad() {
        
    }
    
    func userLinesLoadDidFail(error: Error?) {
        
    }

}
