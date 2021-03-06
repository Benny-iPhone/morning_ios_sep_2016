//
//  SecondViewController.swift
//  UIElements
//
//  Created by Benny Davidovitz on 10/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    @IBOutlet weak var connectionSwitch: UISwitch!
    
    let reachbillity : Reachability
    
    required init?(coder aDecoder: NSCoder) {
        reachbillity = Reachability.forInternetConnection()
        //Reachability(hostName: "https://www.google.com")
        
        super.init(coder: aDecoder)
    }
    
    
/*
     //for doosh
    static var storyboardIdentifier : String{
        get{
            return "SecondViewController"
        }
    }
  */
    static func storyboardIdentifier() -> String{
        return "SecondViewController"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.sendActions(for: .valueChanged)
        
        //object is nil, because i have only one Reachability object
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.handleNotification(_:)), name: NSNotification.Name.reachabilityChanged, object: nil)
        
        reachbillity.startNotifier()
        
        switch reachbillity.currentReachabilityStatus() {
        case NotReachable:
            connectionSwitch.setOn(false, animated: true)
        default:
            connectionSwitch.setOn(true, animated: true)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handleNotification(_ note : Notification){
        switch reachbillity.currentReachabilityStatus() {
        case NotReachable:
            connectionSwitch.setOn(false, animated: true)
        default:
            connectionSwitch.setOn(true, animated: true)
        }
    }

  
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        stepperLabel.text = sender.value.description
        
    }
    
    
    
    
    
    

}
