//
//  MapViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 3/19/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate{
    
    

    @IBOutlet weak var map: MKMapView!
    
    private let coreLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        coreLocationManager.delegate = self
        
        
        coreLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        coreLocationManager.requestWhenInUseAuthorization()
        
        map.mapType = MKMapType.standard
        
        let cl = CLLocationCoordinate2DMake(19.2835, -99.1354)
        
        map.region = MKCoordinateRegion(center: cl, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        let tacos = MKPointAnnotation()
        tacos.coordinate = cl
        tacos.title = "Tec"
        tacos.subtitle = "Cedetec"
        
        map.addAnnotation(tacos)
        
        map.showsScale = true
        map.showsTraffic = true
        map.isZoomEnabled = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            coreLocationManager.startUpdatingLocation()
            map.showsUserLocation = true
        } else {
            coreLocationManager.stopUpdatingLocation()
            map.showsUserLocation = false
        }
    }
    
    
}
