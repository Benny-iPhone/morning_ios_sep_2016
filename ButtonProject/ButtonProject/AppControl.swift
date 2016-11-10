//
//  AppControl.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 10/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class AppControl: UIControl {
    @IBOutlet weak var label : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
        /*{
        get{
            for item in subviews{
                if let lbl = item as? UILabel{
                    return lbl
                }
            }
            return nil

        }
    }*/
    
    private func adjust(alpha : CGFloat){
        for item in subviews{
            item.alpha = alpha
        }
        
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        adjust(alpha: 0.7)
        return super.beginTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        adjust(alpha: 1)
        super.cancelTracking(with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        adjust(alpha: 1)
        super.endTracking(touch, with: event)
    }

}
