//
//  DetailedItem.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 01/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class DetailedItem: Item {
    let plot : String?
    
    override init(_ dict: [String : Any]) {
        plot = dict["Plot"] as? String
        
        super.init(dict)
    }
}










