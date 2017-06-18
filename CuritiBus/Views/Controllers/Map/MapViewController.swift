//
//  MapViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, IMapView {
    
    var presenter: IMapPresenter? {
        didSet {
            presenter?.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mapa"
    }

}
