//
//  Branch.swift
//  Location
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreLocation

class Branch: NSObject {
    let location : CLLocation
    let name : String
    
    init(name : String, latitude : CLLocationDegrees, longitude : CLLocationDegrees) {
        
        self.name = name
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        
        super.init()
        
    }
}














