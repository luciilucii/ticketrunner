//
//  EventInfoMapView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import MapKit

class EventInfoMapView: CustomUIView, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var currentEvent: Event? {
        didSet {
            if let lat = currentEvent?.latidute, let long = currentEvent?.longitude {
                setupEventInMapView(lat: Double(lat), long: Double(long))
            }
        }
    }
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.delegate = self
        return mapView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        addSubview(mapView)
        
        mapView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
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
