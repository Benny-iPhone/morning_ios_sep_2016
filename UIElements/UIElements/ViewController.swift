//
//  ViewController.swift
//  UIElements
//
//  Created by Benny Davidovitz on 10/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    func displayChild(identifier : String){
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            return
        }
        
        displayViewController(nextViewController)
    }
    //https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html
    
    func displayViewController(_ vc : UIViewController){
        //keep strong ref by adding to childViewControllers
        addChildViewController(vc)
        //adjust frame
        vc.view.frame = containerView.bounds
        //add subview in order to be presented
        containerView.addSubview(vc.view)
        //making reference from child to parent
        vc.didMove(toParentViewController: self)
    }
    
    func removeChild(vc : UIViewController){
        vc.willMove(toParentViewController: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        if let currentChild = self.childViewControllers.first{
            removeChild(vc: currentChild)
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            displayChild(identifier: FirstViewController.storyboardIdentifier())
        case 1:
            displayChild(identifier: SecondViewController.storyboardIdentifier())
        default:
            return
        }
        
    }

    


}

