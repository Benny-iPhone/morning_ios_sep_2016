//
//  ViewController.swift
//  GesturesProject
//
//  Created by Benny Davidovitz on 10/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        let point : CGPoint = sender.location(in: self.view)
        //imageView.center = point
        //imageView.frame.origin = point
        
        //animation
        /*
        UIView.animate(withDuration: 1.0) {
            self.imageView.center = point
        }*/
        //linear animation
        let options : UIViewAnimationOptions = .curveLinear
        UIView.animate(withDuration: 1.0, delay: 0, options: options, animations: { 
            self.imageView.center = point
            }, completion: nil)
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

