//
//  ViewController.swift
//  HopaTinderStyle
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let boundry : CGFloat = 25
    
    @IBOutlet weak var targetView: UIView!

    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        let centerX = self.view.bounds.midX
        let point = sender.location(in: self.view)
        //point.y = sender.view!.center.y
        
        if (centerX - boundry...centerX + boundry).contains(point.x){
            sender.view?.center = point
            //pi = 180 degress
            let angle = CGFloat(M_PI * 0.25) / (point.x - centerX)
            sender.view?.transform = CGAffineTransform(rotationAngle: angle)
        } else {
            //make if fly
            
            sender.isEnabled = false
            let screnWidth = self.view.bounds.width
            let targetX = point.x > centerX ? screnWidth * 2 :  -screnWidth
            
            UIView.animate(withDuration: 2, animations: {
                sender.view?.center.x = targetX
                }, completion: nil)
            
            
            
            
        }
        
        
        
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

