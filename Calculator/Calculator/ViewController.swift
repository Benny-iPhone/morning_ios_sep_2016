//
//  ViewController.swift
//  Calculator
//
//  Created by Benny Davidovitz on 06/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let digit : Int = sender.tag
        var text = resultLabel.text ?? ""
        text += "\(digit)"
        
        resultLabel.text = text
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = nil
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

