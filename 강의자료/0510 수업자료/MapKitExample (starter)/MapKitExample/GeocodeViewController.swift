//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit
import MapKit


final class GeocodeViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
        
        let touchPoint = gesture.location(in: gesture.view)
        let coodinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coodinate.latitude, longitude: coodinate.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let adress = placeMark?.first,
                let country = adress.country,
                let administrativeArea = adress.administrativeArea,
                let name = adress.name
                else {return}
            
            print("\n----- [터치 좌표 주소] -----\n")
            print("-\(country) \(administrativeArea) \(name)")
            
            
            
            //let addr = "대한민국 서울특별시 동작구 상도동 159-186"
            let mySweetHome = "대한민국 경기도 동두천시 이담로 89"
            
            geocoder.geocodeAddressString(mySweetHome, completionHandler: { (placeMark, error) in
                guard let placeMark = placeMark?.first else {return}
                print("\(placeMark.location?.coordinate.latitude), \(placeMark.location?.coordinate.longitude)")
            })
        }
        
    }
}
