//
//  ViewController.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 10/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        print(#file)
        print(#function)
        print(#line)
    }
    @IBAction func toggleEnaled(_ sender: UISwitch) {
        button.isEnabled = sender.isOn
    }
    
    @IBAction func trumpAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
    }


}








