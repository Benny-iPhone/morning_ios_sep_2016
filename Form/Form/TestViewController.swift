//
//  TestViewController.swift
//  Form
//
//  Created by Benny Davidovitz on 14/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreLocation

class TestViewController: UIViewController {

    var placesClient: GMSPlacesClient?
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        placesClient = GMSPlacesClient.shared()
    }

    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        
        placesClient?.currentPlace(callback: { (list, error) in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = list {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ").joined(separator: "\n")
                }
            }
        })
        
    }
   

}


















