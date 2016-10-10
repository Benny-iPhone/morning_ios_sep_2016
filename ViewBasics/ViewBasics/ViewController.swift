//
//  ViewController.swift
//  ViewBasics
//
//  Created by Benny Davidovitz on 10/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var newViewRef : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rect = CGRect(x: 30, y: 80, width: 200, height: 200)
        let newView = UIView(frame: rect)
        newView.backgroundColor = UIColor.blue
        view.addSubview(newView)
        
        newView.layer.borderColor = UIColor.yellow.cgColor
        newView.layer.borderWidth = 3
        newView.layer.cornerRadius = 10
        //not affecting on UIView, use it in UIImageView
        newView.layer.masksToBounds = true
        
        self.newViewRef = newView
        
        view.sendSubview(toBack: newView)
        
        if let imageView = view.viewWithTag(2) as? UIImageView{
            let img : UIImage = #imageLiteral(resourceName: "image")
            let radius = img.size.width / 2
            imageView.layer.cornerRadius = radius
            imageView.layer.masksToBounds = true
        }
        
    }
    
    @IBAction func hiddenSwitchAction(_ sender: UISwitch) {
        newViewRef.isHidden = !sender.isOn
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        newViewRef.alpha = CGFloat(sender.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


















