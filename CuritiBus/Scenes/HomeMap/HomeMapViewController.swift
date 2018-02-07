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
    @IBOutlet private weak var topLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomLayoutConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        map.camera = GMSCameraPosition.camera(withLatitude: -25.441105, longitude: -49.276855, zoom: 11.0)
        map.isMyLocationEnabled = true
        //map.mapStyle = GMSMapStyle(contentsOfFileURL: url)
        //https://mapstyle.withgoogle.com
    }
    
    // MARK: - Actions
    
    func scrollViewDidScroll(offset: CGFloat) {
        let offsetY = offset
        
//        if #available(iOS 11.0, *) {
//            offsetY -= view.superview?.safeAreaInsets.top ?? 0
//        } else {
//            offsetY -= scrollView.contentInset.top
//        }
        
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
