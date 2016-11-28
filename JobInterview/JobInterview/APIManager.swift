//
//  APIManager.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 28/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import Alamofire

private let omdbURL = "https://www.omdbapi.com/"

typealias SearchCompletion = (_ array : [Item]?, _ error : Error?) -> Void

class APIManager: NSObject {
    static let manager = APIManager()
    
    func omdb(search term : String, type : Item.ItemType? = nil, page : Int = 1, completion : @escaping SearchCompletion){
        
        var params : [String:Any] = [:]
        
        params["s"] = term
        params["page"] = page
        if let type = type{
            params["type"] = type.rawValue
        }
        
        Alamofire.request(omdbURL, parameters: params).responseJSON { (response) in
            
            guard let json = response.result.value as? [String:Any] else {
                //error
                completion(nil, response.result.error)
                return
            }
            
            //parse result
            let rawArray = json["Search"] as? [[String:Any]] ?? []
            var finalArray : [Item] = []
            
            for dict in rawArray{
                finalArray.append(Item(dict))
            }
            
            completion(finalArray, nil)
            
        }
        
        
    }
}













