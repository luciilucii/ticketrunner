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
                self.lat = lat
                self.long = long
                setupEventInMapView(lat: Double(lat), long: Double(long))
            }
        }
    }
    
    var lat: Float?
    var long: Float?
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.delegate = self
        return mapView
    }()
    
    var pointAnnotation: CustomPointAnnotation!
    var pinAnnotationView: MKPinAnnotationView!
    
    let mapViewId = "mapViewId"
    
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
        
        pointAnnotation = CustomPointAnnotation()
        pointAnnotation.pinCustomImageName = "LocationMarker_new"
        pointAnnotation.coordinate = coordinates
        pointAnnotation.title = "Hello Kitty"
        pointAnnotation.subtitle = "Jiha"
        
        
        
        pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: mapViewId)
        guard let annotation = pinAnnotationView.annotation else { return }
        mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(coordinates, span)
        mapView.setRegion(region, animated: false)
        
        let yourAnnotationAtIndex = 0
        mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: mapViewId)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: mapViewId)
            annotationView?.canShowCallout = true
            let infoButton = UIButton(type: .infoLight)
            annotationView?.rightCalloutAccessoryView = infoButton
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! CustomPointAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinCustomImageName)
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let long = self.long, let lat = self.lat else { return }
        
        let coordinate = CLLocationCoordinate2DMake(Double(lat), Double(long))
        guard let eventName = currentEvent?.name else { return }
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        mapItem.name = eventName
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
}






