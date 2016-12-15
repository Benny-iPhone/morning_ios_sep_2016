//
//  Friend.swift
//  FacebookDemo
//
//  Created by Benny Davidovitz on 15/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class Friend: NSObject {
    let id : String?
    let name : String?
    let imageURL : URL?
    
    init(_ dict : [String:Any]) {
        
        self.id = dict["id"] as? String
        self.name = dict["name"] as? String
        
        if let picture = dict["picture"] as? [String:Any],
        let data = picture["data"] as? [String:Any],
        let urlString = data["url"] as? String,
            let url = URL(string: urlString){
            self.imageURL = url
        } else {
            self.imageURL = nil
        }
        
        super.init()
        
    }
    
}




