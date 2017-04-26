//
//  User.swift
//  MapkitDemo
//
//  Created by JC Dy on 4/19/17.
//  Copyright © 2017 JC Dy. All rights reserved.
//

import UIKit
import MapKit

class User: NSObject {
    
    let userName: String!
    let userBio: String!
    let userLocation: CLLocation!
    
    init(name: String, bio: String, loc: CLLocation) {
        userName = name
        userBio = bio
        userLocation = loc
    }
    
    
    
}
