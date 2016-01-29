//
//  ViewController.swift
//  Mapkit_Swift
//
//  Created by Jamaal Sedayao on 1/29/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit
import MapKit

//27.175282, 78.042166

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapLocation()
    }

    func mapLocation(){
        
        //coordindates
        let lat: CLLocationDegrees = 27.175282
        let long: CLLocationDegrees = 78.042166
        
        let tajCoord = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        
        //Span
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        let tajSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //Region
        let tajRegion = MKCoordinateRegion(center: tajCoord, span: tajSpan)
        
        mapView.setRegion(tajRegion, animated: true)
        
        let tajAnnotation = MKPointAnnotation()
        tajAnnotation.title = "Taj Mahal"
        tajAnnotation.subtitle = "She walks in beauty."
        tajAnnotation.coordinate = tajCoord
        
        mapView.addAnnotation(tajAnnotation)
        
    }
    
    
}

