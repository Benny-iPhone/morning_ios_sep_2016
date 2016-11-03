//
//  RoundImageView.swift
//  ImageView
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    private func initialize(){
        let radius = max(frame.width, frame.height) / 2
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    //after constraints happened
    override func layoutSubviews() {
        super.layoutSubviews()
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        initialize()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        initialize()
    }

}








