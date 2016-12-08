//
//  Branch.swift
//  Location
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Branch: NSObject , MKAnnotation{
    let location : CLLocation
    let name : String
    
    var coordinate: CLLocationCoordinate2D{
        get{
            return location.coordinate
        }
    }
    
    var title: String?{
        get{
            return name
        }
    }
    
    init(name : String, latitude : CLLocationDegrees, longitude : CLLocationDegrees) {
        
        self.name = name
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        
        super.init()
        
    }
}














