//
//  ViewController.swift
//  SliderSample
//
//  Created by Benny Davidovitz on 06/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var degreesLabel: UILabel!
    
    @IBOutlet weak var radiansLabel: UILabel!
    
    @IBAction func sliderValueChangedAction(_ sender: UISlider) {
        
        degreesLabel.text = Int(sender.value).description
        let r = sender.value.degreesToRadians
        radiansLabel.text = r.description
        /*
        let str = String(format: "%.2f", sender.value)
        label.text = str//sender.value.description
         */
        
        let color = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderValueChangedAction(slider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

