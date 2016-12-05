//
//  BranchDetailsViewController.swift
//  Location
//
//  Created by Benny Davidovitz on 05/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class BranchDetailsViewController: UIViewController {

    var branch : Branch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = branch.name
    }
    //http://handleopenurl.com/scheme/waze
    //http://useyourloaf.com/blog/querying-url-schemes-with-canopenurl/
    @IBAction func wazeAction(_ sender: Any) {
        //waze://?ll=37.331689,-122.030731&navigate=yes
        
        let lat = branch.location.coordinate.latitude
        let lon = branch.location.coordinate.longitude
        let wazeString = "waze://?ll=\(lat),\(lon)&navigate=yes"
        
        let url = URL(string: wazeString)!
        if UIApplication.shared.canOpenURL(url){
            //waze installed
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("waze not installed")
        }
        
    }
    
}
