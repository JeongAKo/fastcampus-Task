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
    let temp = CLLocationCoordinate2D()
    var placeCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.addSubview(textFeild)
        autoLayout()
        textFeild.delegate = self
        mapView.mapType = .standard
    }
    
    func addAnnotation(_ stringAdress:String, _ geoAdress:CLPlacemark) {
        // MapView delegate
        mapView.delegate = self
        
        // 장소 count 세기
        placeCount += 1
        
        // 위도, 경도 값 저장
        let latitude = geoAdress.location!.coordinate.latitude
        let longitude = geoAdress.location!.coordinate.longitude

         // addAnnotaition의 위치 정보 입력
        let nextDestination = MKPointAnnotation()
        nextDestination.title = "\(placeCount)번째 행선지"
        nextDestination.subtitle = stringAdress
        nextDestination.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        mapView.addAnnotation(nextDestination)
        
        // span, region 설정
        let span = MKCoordinateSpan.init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion.init(center: geoAdress.location!.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        if placeCount == 1 {
            
        } else {
            addLine(temp, geoAdress.location!.coordinate)
        }
        
        addRectangle(geoAdress.location!.coordinate)
    }
    
    func addLine(_ firstsender: CLLocationCoordinate2D, _ secondSender: CLLocationCoordinate2D) {
        
        let point1 = firstsender
        let point2 = secondSender
        
        let points: [CLLocationCoordinate2D] = [point1, point2]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
    }
    
    func addRectangle(_ sender: CLLocationCoordinate2D) {
        let center = sender
        
        var point1 = center; point1.longitude += 0.01;  point1.latitude -= 0.01;
        var point2 = center; point2.longitude += 0.01;  point2.latitude -= 0.01;
        var point3 = center; point3.longitude += 0.01;  point3.latitude -= 0.01;
        var point4 = center; point4.longitude += 0.01;  point4.latitude -= 0.01;
    
    
    }
    
    
    // 맵 검색 ( geocoder를 이용하여 주소를 좌표로 변환 )
    func searchMap(_ adrr: String) {
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(adrr) { (placeMark, error) in
            if error != nil {
                return print(error?.localizedDescription)
            }
            guard let adress = placeMark?.first else {return}
            self.addAnnotation(adrr, adress)
        }
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


// textField 에서 값 가져오기
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text else { return false }
        // textField의 값이 있을때, searchMap함수 호출
        searchMap(text)
        // 키보드 내리기
        textField.resignFirstResponder()

        return true
    }
}


extension ViewController: MKMapViewDelegate {
    
}
