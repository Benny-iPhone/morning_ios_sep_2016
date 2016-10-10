//
//  ViewController.swift
//  ColorSliders
//
//  Created by Benny Davidovitz on 06/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var targetView: UIView!
    
    
    @IBAction func sliderChangedAction(_ sender: AnyObject) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        targetView.backgroundColor = color
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderChangedAction(redSlider)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

