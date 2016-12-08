//
//  MapViewController.swift
//  Location
//
//  Created by Benny Davidovitz on 08/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let branches = AppManager.manager.branches
        mapView.addAnnotations(branches)
        
        mapView.delegate = self
//        for b in branches{
//            mapView.addAnnotation(b)
//        }

        // Do any additional setup after loading the view.
    }
    
    //MARK: - MKMapView Delegate
    //just like tableview's cellForRow
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Branch else {
            //user's location annotation
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "ann")
        if let annView = annView{
            //update data for annotation view
            annView.annotation = annotation
        } else {
            //no annotation view to deque, create new one
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ann")
            (annView as? MKPinAnnotationView)?.pinTintColor = .blue
            
            annView?.canShowCallout = true
            annView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
            //annView?.detailCalloutAccessoryView = UIButton(type: .infoLight)
        }
        
        return annView
    }
    
    func mapView(_ mapView: MKMapView, annotationView annView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        
        //self.performSegue(withIdentifier: "map_show_details", sender: annView)
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "BranchDetailsViewController") as? BranchDetailsViewController,
            let branch = annView.annotation as? Branch
        
        else {
            print("no proper BranchDetailsViewController found")
            return
        }
        
        nextVC.branch = branch
        navigationController?.show(nextVC, sender: control)
        
    }
}





























