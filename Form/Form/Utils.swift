//
//  Utils.swift
//  Form
//
//  Created by Benny Davidovitz on 07/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

extension UIView{
    
    func hideKeyboard() -> Bool{
        
        if self.isFirstResponder{
            self.resignFirstResponder()
            
            return true
        }
        
        for child in self.subviews{
            if child.hideKeyboard(){
                return true
            }
        }
        
        return false
    }
    
}












