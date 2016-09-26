//
//  ViewController.swift
//  HelloXcode
//
//  Created by Benny Davidovitz on 19/09/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    
    @IBAction func myAction(_ sender: AnyObject) {
        
        //let text : String = textField.text != nil ? textField.text! : ""
        let text : String = textField.text ?? "" //be textField.text if not nil, else ""
        resultLabel?.text = "hello " + text
        
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














