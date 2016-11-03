//
//  ViewController.swift
//  SpriteSheetAnimationSample
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let spriteSheetImage = #imageLiteral(resourceName: "capguy-walk")
        let images = spriteSheetImage.spriteSheetImages(rows: 1, columns: 8)
        
        let imageView = UIImageView(image: images.first)
        imageView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        imageView.animationImages = images
        imageView.animationDuration = 0.45 //seconds
        imageView.animationRepeatCount = 0
        
        view.addSubview(imageView)
        
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapAction(_:)))
        imageView.addGestureRecognizer(tapGesture)
        
    }

    func tapAction(_ sender : UITapGestureRecognizer){
        guard let imageView = sender.view as? UIImageView else {
            return
        }
        
        if imageView.isAnimating{
            imageView.stopAnimating()
        } else {
            imageView.startAnimating()
        }
    }


}










