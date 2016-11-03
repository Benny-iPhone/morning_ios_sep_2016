//
//  ToastLabel.swift
//  Toaster
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ToastLabel: UILabel {

    static func show(with text : String, duration : TimeInterval = 3){
        
        let app = UIApplication.shared //application
        let appDelegate = app.delegate //application's sanjer
        let window = appDelegate!.window!! //root view
        
        //create rect for label based on window's size
        var windowRect : CGRect = window.bounds
        
        windowRect.origin.x = windowRect.width * 0.1
        windowRect.origin.y = windowRect.height * 0.05
        
        windowRect.size.height *= 0.1
        windowRect.size.width *= 0.8
        
        let label = ToastLabel(frame: windowRect)
        label.text = text
        //label.center = CGPoint(x: window.bounds.midX, y: window.bounds.midY)
        
        label.alpha = 0
        
        
        UIView.animate(withDuration: duration, animations: {
            //fade in
            label.alpha = 1
            }) { (_) in
                //fade out
                UIView.animate(withDuration: duration, animations: { 
                    label.alpha = 0
                    }, completion: { (_) in
                        //done
                        label.removeFromSuperview()
                })
                
        }
        window.addSubview(label)
        
    }
    
    private func initialize(){
        
        backgroundColor = .blue
        textColor = .white
        
        //round corner
        layer.cornerRadius = 10
        layer.masksToBounds = true //content won't be off limits
        
        font = UIFont.boldSystemFont(ofSize: 24)
        numberOfLines = 0
        textAlignment = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

}







