//
//  ViewController.swift
//  MotionEffect
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //redView.backgroundColor = .green
        //KVC = Key Value Coding
        //redView.setValue(UIColor.green, forKey: "backgroundColor")
        //let bgColor = redView.value(forKey: "backgroundColor")
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -view.bounds.width / 2
        horizontalMotionEffect.maximumRelativeValue = view.bounds.width / 2
        
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -100
        verticalMotionEffect.maximumRelativeValue = 100
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect,verticalMotionEffect]
        
        redView.addMotionEffect(group)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}










