//
//  ViewController.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = AppLabel(frame: CGRect(x: 10, y: 40, width: 300, height: 90))
        label.text = "Label from code Second Line Label from code Second Line Label from code Second Line Label from code Second Line Label from code Second Line"
        view.addSubview(label)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

