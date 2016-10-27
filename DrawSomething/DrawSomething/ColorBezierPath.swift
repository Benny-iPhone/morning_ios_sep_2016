//
//  ColorBezierPath.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    var strokeColor : UIColor
    
    init(strokeColor : UIColor) {
        self.strokeColor = strokeColor
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func stroke() {
        strokeColor.setStroke()
        super.stroke()
    }
}












