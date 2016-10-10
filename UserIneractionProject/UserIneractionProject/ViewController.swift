//
//  ViewController.swift
//  UserIneractionProject
//
//  Created by Benny Davidovitz on 10/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    
    @IBAction func clickAction(_ sender: AnyObject) {
        print("button pressed")
    }
    
    @IBAction func userInteractionValueChangedAction(_ sender: UISwitch) {
        
        mainView.isUserInteractionEnabled = sender.isOn
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

