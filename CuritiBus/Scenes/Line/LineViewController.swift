//
//  LineViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 06/02/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class LineViewController: UIViewController, ILineView {

    var configurator: ILineConfigurator!
    var presenter: ILinePresenter!

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }
    
    // MARK: - Actions
    
    @IBAction func toggleFavorited() {
        presenter.favorite()
    }
    
    // MARK: - ILineView
    
    func didFavoriteLine() {
        
    }
    
    func didUnfavoriteLine() {
        
    }

}
