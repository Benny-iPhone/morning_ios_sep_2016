//
//  TraingleView.swift
//  Drawing
//
//  Created by Benny Davidovitz on 13/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class TraingleView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.move(to: CGPoint(x: 100, y: 30))
        context.addLine(to: CGPoint(x: 180, y: 130))
        context.addLine(to: CGPoint(x: 20, y: 130))
        
        context.closePath()
        
        context.move(to: CGPoint.zero)
        context.addQuadCurve(to: CGPoint(x: 100, y: 0), control: CGPoint(x: 100, y: 30))
        
        context.setLineWidth(3)
        //UIColor.red.setStroke()
        context.setStrokeColor(UIColor.red.cgColor)
    
        context.setFillColor(UIColor.yellow.cgColor)
        
        //context.fillPath()
        //context.strokePath()
        
        context.drawPath(using: .fillStroke)
        
        
    }
    

}




















