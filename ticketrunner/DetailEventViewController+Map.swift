//
//  DetailEventViewController+Map.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import MapKit

extension DetailEventController: MKMapViewDelegate {
    
    //TODO: Custom Annotation
    func setupEventInMapView(lat: Double, long: Double) {
        
        let location = CLLocation(latitude: lat, longitude: long)
        let coordinates = location.coordinate
        
        let pointAnnotation = CustomPointAnnotation()
        pointAnnotation.pinCustomImageName = "LocationMarker_new"
        pointAnnotation.coordinate = coordinates
        
        mapView.addAnnotation(pointAnnotation)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(coordinates, span)
        mapView.setRegion(region, animated: false)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let mapViewId = "mapViewId"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: mapViewId)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: mapViewId)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! CustomPointAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinCustomImageName)
        
        return annotationView
    }
    
    
}
