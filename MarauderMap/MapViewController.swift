//
//  ViewController.swift
//  MapkitDemo
//
//  Created by JC Dy on 4/19/17.
//  Copyright © 2017 JC Dy. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var recording = false
    var mytimer:Timer?
    var started = false
    var red = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 37.8719, longitude: -122.2585)
        centerMapOnLocation(location: initialLocation)
        self.mapView.showsUserLocation = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !recording {
            //starttime = Date()
           
            mytimer = Timer.scheduledTimer(timeInterval: 0.6, target: self,
                                           selector: #selector(MapViewController.updateTime(_timer:)),
                                           userInfo: nil,
                                           repeats: true)
            recording = true
        }
        else {
            //mytimer?.invalidate()
        }
    }
    
    var i = 0.0001
    func updateTime(_timer: Timer) {
        //let newtime = initialdate.timeIntervalSinceNow
        i += 0.0001
        if (started) {
            let allAnnotations = self.mapView.annotations
            self.mapView.removeAnnotation(allAnnotations as! MKAnnotation)
        }
        //started = true
        var userdictionary = [String: [Double]]()
        userdictionary["Nab"] = [37.8719 + i, -122.2585]
        
        var coordinatesarray: [CLLocationCoordinate2D] = []
        for (key, value) in userdictionary {
            let lat = value[0]
            let lon = value[1]
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            var annotation = Dot.init(title: key, coll: MKPinAnnotationView.greenPinColor(), coordinate: coordinate)
            //print(red)
            if (red) {
                //annotation.pinTintColor() = MKPinAnnotationView.redPinColor()
                //annotation.setTintColor(col: UIColor.red)
                annotation = Dot.init(title: key, coll: UIColor.red, coordinate: coordinate)
                red = false
            } else {
                 annotation = Dot.init(title: key, coll: UIColor.green, coordinate: coordinate)
                red = true
            }
            mapView.addAnnotation(annotation)
        }
        
        //TimeInterval newtime = _timer.timeInterval;
    }

    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func makeAnnotation(location: CLLocation) {
        
        
    }
    
    func updateAnnotation(location: CLLocation) {
        
        
    }

}

