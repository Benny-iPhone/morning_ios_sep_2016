//
//  Brain.swift
//  Calculator
//
//  Created by Benny Davidovitz on 10/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

enum Operator : Int{
    case plus = 100, minus, multi, div
    case equal = 200,root, square, sin, cos
}

class Brain: NSObject {
    
    var firstString = ""
    
    func add(digit : String) -> String{
        firstString += digit
        return firstString
    }
    
    func add(operator : Operator) -> String{
        return ""
    }
    
    func clear() -> String{
        return "0"
    }
}












