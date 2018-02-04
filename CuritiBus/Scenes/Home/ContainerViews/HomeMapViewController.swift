//
//  HomeMapViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 03/02/2018.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeMapViewController: UIViewController {
    
    @IBOutlet private weak var map: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.camera = GMSCameraPosition.camera(withLatitude: -25.441105, longitude: -49.276855, zoom: 11.0)
        map.isMyLocationEnabled = true
    }

}
