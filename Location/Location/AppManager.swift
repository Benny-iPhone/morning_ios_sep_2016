//
//  AppManager.swift
//  Location
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import CoreLocation

class AppManager: NSObject , CLLocationManagerDelegate{
    static let manager = AppManager()
    static let kNewLocationNotification = "new_location"
    
    let branches : [Branch]
    let locationManager : CLLocationManager
    
    override init() {
        branches = [
            Branch(name: "Azrieli-TelAviv", latitude: 32.0743349, longitude: 34.7898284),
            Branch(name: "Gold Mall", latitude: 31.9905929, longitude: 34.772315),
            Branch(name: "Dizingof Center", latitude: 32.0754815, longitude: 34.7735417),
            Branch(name: "City Tower", latitude: 32.0846935, longitude: 34.797396),
            Branch(name: "Ice Mall", latitude: 29.5541136, longitude: 34.9634143),
            Branch(name: "Eiffel Tower", latitude: 48.8583736, longitude: 2.2922926),
            Branch(name: "Mall Of Asia", latitude: 14.5350632, longitude: 120.9799433)
        ]
        
        
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.distanceFilter = 100 //meter
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func startLocation(){
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .denied:
            print("user denied")
            return
        case .notDetermined, .restricted:
            //foreground
            locationManager.requestWhenInUseAuthorization()
            //also background
            //locationManager.requestAlwaysAuthorization()
        default:
            break
        }
        
        locationManager.startUpdatingLocation()
    }
 
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        
        let name = Notification.Name(rawValue: AppManager.kNewLocationNotification)
        NotificationCenter.default.post(name: name, object: self)
    }
}













