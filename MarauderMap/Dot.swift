//
//  dot.swift
//  MarauderMap
//
//  Created by Wilson Wang on 4/26/17.
//  Copyright © 2017 Wilson Wang. All rights reserved.
//

import Foundation
import MapKit

class Dot: NSObject, MKAnnotation {
    let title: String?
    //let locationName: String
    //let discipline: String
    let coordinate: CLLocationCoordinate2D
    var color: UIColor
    
    init(title: String, coll: UIColor, coordinate: CLLocationCoordinate2D) {
        self.title = title
        //self.locationName = locationName
        //self.discipline = discipline
        self.coordinate = coordinate
        color = coll
        
        super.init()
    }
    
    var subtitle: String? {
        return title
    }
    
    func setTintColor(col: UIColor) {
        color = col
        print(color)
    }
    
    func pinTintColor() -> UIColor {
        //return MKPinAnnotationView.redPinColor()
        return color
    }
}

