//
//  Model.swift
//  MVC
//
//  Created by hackeru on 26 Elul 5776.
//  Copyright © 5776 hackeru. All rights reserved.
//

import Foundation

extension String{
    /*
    //method
    //usage: str.isValidEmail()
    func isValidEmail() -> Bool{
        return true
    }
    */
    //computed property
    //usage: str.isEmail
    //inspired from http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
    var isEmail : Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}

/*
 let str
 
 str.isValidEmail()
 str.isEmail
 
 
 */
















