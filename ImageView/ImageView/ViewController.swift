//
//  ViewController.swift
//  ImageView
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = #imageLiteral(resourceName: "rain")//UIImage(named: "rain")
        let imageView = UIImageView(image: image)
        //image.size
        
        imageView.frame.origin = CGPoint(x: 50, y: 50)
        /*self.*/view.addSubview(imageView)
    }


}











