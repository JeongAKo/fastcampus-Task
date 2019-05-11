//
//  ViewController.swift
//  MapKitPrac
//
//  Created by Daisy on 11/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit
import MapKit

final class Annotation: NSObject, MKAnnotation{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

class ViewController: UIViewController {
    
    let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        autoLayout()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        checkAuthorizationStatus()
    }
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied :
            break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            startUpdateLocation()
            print("authorized")
        @unknown default: break
            
        }
    }
    
    func startUpdateLocation() {
        let status = CLLocationManager.authorizationStatus()
        guard status == .authorizedAlways || status == .authorizedWhenInUse, CLLocationManager.locationServicesEnabled()
            else {return}
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0 //kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
    }
    
    func autoLayout() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let current = locations.last!
        
        if (abs(current.timestamp.timeIntervalSinceNow) < 10 ){
            let coordinate = current.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
            addAnnotation(location: current)
        }
    }
    
    func addAnnotation(location: CLLocation) {
        let annotation = Annotation(title: "My Location", coordinate: location.coordinate)
        mapView.addAnnotation(annotation)
    }
}
