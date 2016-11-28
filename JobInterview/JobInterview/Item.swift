//
//  Item.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 28/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class Item: NSObject {
    enum ItemType : String{
        case movie = "movie"
        case series = "series"
        case episode = "episode"
    }
    
    let title : String?
    let year : String?
    let imdbID : String?
    let type : ItemType?
    let poster : URL?
    
    init(_ dict : [String:Any]) {
        title = dict["Title"] as? String
        year = dict["Year"] as? String
        imdbID = dict["imdbID"] as? String
        
        if let typeString = dict["Type"] as? String{
            type = ItemType(rawValue: typeString)
        } else {
            type = nil
        }
        
        if let urlString = dict["Poster"] as? String{
            poster = URL(string: urlString)
        } else {
            poster = nil
        }
        
        super.init()
    }
}











