//
//  ViewController.swift
//  MapkitDemo
//
//  Created by JC Dy on 4/19/17.
//  Copyright © 2017 JC Dy. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseAuth

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var recording = false
    var mytimer:Timer?
    var started = false
    var red = true
    var lat = 0
    var lon = 0
    var currLocation = CLLocation()
    var ref:FIRDatabaseReference?
    
    // Map ID to Double array [latitude, longitude]
    var userdictionary = [String: [Double]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = FIRDatabase.database().reference()
        let initialLocation = CLLocation(latitude: 37.8719, longitude: -122.2585)
        centerMapOnLocation(location: initialLocation)
        self.mapView.showsUserLocation = true
        
        let locManager = CLLocationManager()
        if (CLLocationManager.locationServicesEnabled()) {
            currLocation = locManager.location!

        } else {
            locManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !recording {
            //starttime = Date()
           
            mytimer = Timer.scheduledTimer(timeInterval: 2, target: self,
                                           selector: #selector(MapViewController.updateTime(_timer:)),
                                           userInfo: nil,
                                           repeats: true)
            recording = true
        }
        else {
            //mytimer?.invalidate()
        }
    }
    
    func updateTime(_timer: Timer) {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        let lg = currLocation.coordinate.longitude
        let lt = currLocation.coordinate.latitude
        let user = FIRAuth.auth()?.currentUser
        ref?.child("Users").child((user?.uid)!).child("Name").setValue(user?.displayName)
        ref?.child("Users").child((user?.uid)!).child("Latitude").setValue(lt)
        ref?.child("Users").child((user?.uid)!).child("Longitude").setValue(lg)
        
        ref?.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
            let usersDict = snapshot.value as! NSDictionary
            for val in usersDict.allValues {
                let dict = val as! NSDictionary
                let coordinate = CLLocationCoordinate2D(latitude: dict["Latitude"] as! Double, longitude: dict["Longitude"] as! Double)
                let annotation = Dot.init(title: dict["Name"] as! String, coll: MKPinAnnotationView.greenPinColor(), coordinate: coordinate)
                self.mapView.addAnnotation(annotation)
                
            }
        })

    }

    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

