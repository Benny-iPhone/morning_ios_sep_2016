//
//  Utils.swift
//  Form
//
//  Created by Benny Davidovitz on 07/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import libPhoneNumber_iOS

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


//inspired from
//http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift

extension String{
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPhoneNumber() -> Bool{
        let phoneUtil = NBPhoneNumberUtil()
        
        guard let phoneNumber: NBPhoneNumber = try? phoneUtil.parse(self, defaultRegion: "IL") else{
            return false
        }
        
        return phoneUtil.isValidNumber(phoneNumber)
    }
}


















