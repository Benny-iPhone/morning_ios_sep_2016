//
//  Food.swift
//  MenuTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class Food: NSObject {
    let title : String?
    let desc : String?
    let url : URL?
    let price : Int?
    
    init(_ dict : [String:Any]) {
        title = dict["title"] as? String
        desc = dict["desc"] as? String
        price = dict["price"] as? Int
        
        if let urlString = dict["url"] as? String{
            url = URL(string: urlString)
        } else {
            url = nil
        }
        
        super.init()
    }
    
    static func allFood() -> [Food]
    {
        guard let path = Bundle.main.path(forResource: "menu", ofType: "plist") else {
            print("no file found")
            return []
        }
        
        //NSArray(contentsOfFile: )
        guard let rawArray = NSArray(contentsOfFile: path) else {
            print("file is not an array")
            return []
        }
        
        guard let array = rawArray as? [[String:Any]] else {
            print("array has wrong format")
            return []
        }
        
        var finalArray : [Food] = []
        
        for dict in array{
            let food = Food(dict)
            finalArray.append(food)
        }
        
        return finalArray
        
    }
    
}





















