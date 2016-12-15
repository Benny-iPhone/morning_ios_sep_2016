//
//  AppManager.swift
//  FacebookDemo
//
//  Created by Benny Davidovitz on 15/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import FacebookCore

typealias FriendsCompletion = (_ arr : [Friend]) -> Void

class AppManager: NSObject {
    static let manager = AppManager()
    
    func getUserFriends(completion : @escaping FriendsCompletion){
        let params : [String:Any] = [
            "limit":500
        ]
        let request = GraphRequest(graphPath: "/me/taggable_friends", parameters: params)
        let connection = GraphRequestConnection()
        connection.add(request, completion: {response , result in
        
            var finalArray : [Friend] = []
            
            switch result {
            case .success(let response):
                if let dict = response.dictionaryValue,
                let data = dict["data"] as? [[String:Any]]{
                    for item in data{
                        finalArray.append(Friend(item))
                    }
                    
                }
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
            
            completion(finalArray)
        })
        
        connection.start()
    }
}

















