//
//  RendererOverlayViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit
import MapKit

final class RendererOverlayViewController: UIViewController {
  
    

    @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func addCircle(_ sender: Any) {
    let center = mapView.centerCoordinate
    let circle = MKCircle(center: center, radius: 40000)
    mapView.addOverlay(circle)
  }
  
    
    @IBAction func homeButton(_ sender: Any) {
        
        let goToMaMaHome = CLLocationCoordinate2DMake(38.072650, 127.287899)
        
        var point1 = goToMaMaHome; point1.latitude += 0.45
        var point2 = goToMaMaHome; point2.longitude += 0.45;   point2.latitude -= 0.45
        var point3 = goToMaMaHome; point3.longitude -= 0.45;  point3.latitude += 0.45
      
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point3]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
        
    }
    
    
    
  @IBAction func addStar(_ sender: Any) {
    let center = mapView.centerCoordinate
    
    var point1 = center; point1.latitude += 0.65
    var point2 = center; point2.longitude += 0.4;   point2.latitude -= 0.15
    var point3 = center; point3.longitude -= 0.45;  point3.latitude += 0.4
    var point4 = center; point4.longitude += 0.45;  point4.latitude += 0.4
    var point5 = center; point5.longitude -= 0.4;   point5.latitude -= 0.15
    
    let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point5, point1]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyline)
    
  }
  
  @IBAction private func removeOverlays(_ sender: Any) {
    
    mapView.removeOverlays(mapView.overlays)
  }

}

extension RendererOverlayViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let circle = overlay as? MKCircle {
            let renderer = MKCircleRenderer(circle: circle)
            renderer.strokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            renderer.lineWidth = 4
            return renderer
        }
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            renderer.lineWidth = 4
            return renderer
        }
//        if let goToMaMaHome = overlay as? MKPolyline {
//            let renderer = MKPolylineRenderer(polyline: polyline)
//            renderer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
//            renderer.lineWidth = 5
//            return renderer
//        }
        return MKOverlayRenderer(overlay: overlay)
    }
    

}
