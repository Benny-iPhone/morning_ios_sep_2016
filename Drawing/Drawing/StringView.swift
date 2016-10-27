//
//  StringView.swift
//  Drawing
//
//  Created by Benny Davidovitz on 13/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class StringView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        context.addEllipse(in: self.bounds)
        context.strokePath()
        
        let text : NSString = "Test Text 😇"

        let pStyle = NSMutableParagraphStyle()
        pStyle.alignment = .center
        
        let atts : [String:Any] = [
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 20),
            NSForegroundColorAttributeName:UIColor.blue,
            NSUnderlineStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue,
            NSParagraphStyleAttributeName:pStyle
        ]
        text.draw(in: self.bounds, withAttributes: atts)
        
    }
    

}













