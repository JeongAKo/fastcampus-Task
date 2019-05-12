//
//  ViewController.swift
//  MapKitPrac
//
//  Created by Daisy on 11/05/2019.
//  Copyright © 2019 고정아. All rights reserved.
//


import MapKit
import UIKit

final class ViewController: UIViewController {
    
    let textFeild: UITextField = {
        let textFeild = UITextField()
        textFeild.font = UIFont.systemFont(ofSize: 25)
        textFeild.backgroundColor = .white
        textFeild.borderStyle = .roundedRect
        return textFeild
    }()
    
    let mapView = MKMapView()
    
    var placeNum = 0
    
    private let locationManager = CLLocationManager()
    
    var latitude: CLLocationDegrees = 0.0
    var longitude: CLLocationDegrees = 0.0
    var nextDestinaton = CLLocationCoordinate2DMake(0.0, 0.0)


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.addSubview(textFeild)
        autoLayout()
        textFeild.delegate = self
        locationManager.delegate = self
        //        mapView.showsUserLocation = true
        mapView.mapType = .standard
        
    }
    
    func addAnnotation() {
        
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
 
    func moveToDestiantion(_ sender: Any) {
        guard !mapView.annotations.isEmpty else {return}

        let annotation = mapView.annotations[0]
        setRegion(coordinate: annotation.coordinate)
        
    }
    
    func autoLayout() {
        
        let guide = view.safeAreaLayoutGuide
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        textFeild.topAnchor.constraint(equalTo: guide.topAnchor, constant: 5).isActive = true
        textFeild.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5).isActive = true
        textFeild.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5).isActive = true
        textFeild.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let text = textField.text
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString("\(text)", completionHandler: { (placeMark, error) in
            guard let placeMark = placeMark?.first else {return}
            
            self.latitude = placeMark.location?.coordinate.latitude ?? 0.0
            self.longitude =  placeMark.location?.coordinate.longitude ?? 0.0
            self.mapView.addAnnotation(self.nextDestinaton as! MKAnnotation)
            
//            print("\(placeMark.location?.coordinate.latitude), \(placeMark.location?.coordinate.longitude)")
        })
        
        return true
    }
}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currernt = locations.last!
        
        if (abs(currernt.timestamp.timeIntervalSinceNow) < 10 ){
            let coordinate = currernt.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
//            addAnnotation(location: currernt)
        }
    }
    
//    func addAnnotation(location: CLLocation) {
//        let annotation = Annotation(title: "My Location", coordinate: location.coordinate)
//        mapView.addAnnotation(annotation)
//    }
}
