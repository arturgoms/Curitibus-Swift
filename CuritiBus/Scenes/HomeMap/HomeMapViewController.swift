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
    
    @IBOutlet weak var map: GMSMapView!
    @IBOutlet private weak var topLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomLayoutConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.camera = GMSCameraPosition.camera(withLatitude: -25.441105, longitude: -49.276855, zoom: 11.0)
        map.isMyLocationEnabled = true
    }
    
    // MARK: - Actions
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetY = -scrollView.contentOffset.y
        
        if #available(iOS 11.0, *) {
            offsetY -= view.superview?.safeAreaInsets.top ?? 0
        } else {
            offsetY -= scrollView.contentInset.top
        }
        
        self.view.superview?.clipsToBounds = offsetY <= 0
        
        if offsetY >= 0 {
            topLayoutConstraint.constant = -offsetY
            bottomLayoutConstraint.constant = 0
        } else {
            topLayoutConstraint.constant = -offsetY/2
            bottomLayoutConstraint.constant = offsetY/2
        }
    }

}
