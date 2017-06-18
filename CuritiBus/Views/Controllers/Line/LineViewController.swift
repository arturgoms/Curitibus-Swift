//
//  LineViewController.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 17/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import MapKit

class LineViewController: UIViewController, MKMapViewDelegate, ILineView {
    
    var line: Line!
    
    @IBOutlet private weak var mapView: MKMapView! {
        didSet {
            mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(-25.441105, -49.276855), 10000, 10000), animated: true)
        }
    }
    
    var presenter: ILinePresenter? {
        didSet {
            presenter?.view = self
        }
    }
    
    //MARK: - UIView Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadShapes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: - Actions
    
    func loadShapes() {
        presenter?.loadShapes(line: line)
    }
    
    //MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polyLine = overlay
            let polyLineRenderer = MKPolylineRenderer(overlay: polyLine)
            polyLineRenderer.strokeColor = UIColor.blue
            polyLineRenderer.lineWidth = 5.0
            
            return polyLineRenderer
        }
        
        return MKPolylineRenderer()
    }
    
    //MARK: - UIView ILineView
    
    func urbsShapesLoaded(shapes: [UrbsShape]) {
        var shapesDict = [String: [UrbsShape]]()
        shapes.forEach({ shapesDict[$0.shp!] = [] })
        shapes.forEach({ shapesDict[$0.shp!]?.append($0) })
        
        for key in shapesDict.keys {
            let shapes = shapesDict[key]!
            
            var coords = [CLLocationCoordinate2D]()
            for index in 0..<shapes.count-1 {
                
                let shp1 = shapes[index]
                let shp2 = shapes[index+1]
                
                let coord1 = CLLocationCoordinate2DMake(shp1.latitude!, shp1.longitude!)
                let coord2 = CLLocationCoordinate2DMake(shp2.latitude!, shp2.longitude!)
                coords.append(coord1)
                coords.append(coord2)
            }
            let polyline = MKPolyline(coordinates: coords, count: coords.count)
            mapView.add(polyline)
            
            let polygon = MKPolygon(coordinates: coords, count: coords.count)
            mapView.setRegion(MKCoordinateRegionForMapRect(polygon.boundingMapRect), animated: true)
            
        }
    }
    
    func urbsShapesDidFailLoad(error: ErrorResponse?) {
        
    }

}
