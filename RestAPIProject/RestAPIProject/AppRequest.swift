//
//  AppRequest.swift
//  RestAPIProject
//
//  Created by Benny Davidovitz on 08/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

typealias AppRequestCompletion = (_ result : Any?, _ error : Error?) -> Void

class AppRequest: NSObject {
    enum `Type` : String{
        case posts = "posts"
        case comments = "comments"
        
        func urlString() -> String{
            //depends on environment
            let baseURL = "https://jsonplaceholder.typicode.com/"
            return baseURL + self.rawValue
        }
        
        func isPost() -> Bool{
            switch self {
            case .posts:
                return false
            case .comments:
                return true
            }
        }
    }
    
    let type : Type
    var respondOnMainThread : Bool
    var params : [String:Any]
    
    init(type : Type) {
        self.type = type
        self.respondOnMainThread = true
        self.params = [:]
        super.init()
    }
    
    //MARK: - Send Request
    
    func send(completion : @escaping AppRequestCompletion){
        //TODO: check internet connection using Reachabillity
        URLSession.shared.dataTask(with: createRequest(), completionHandler: {data, response,error in
        
            self.handle(data: data, error: error, completion: completion)
            
        }).resume()
    }
    
    private func handle(data : Data?, error : Error?, completion : @escaping AppRequestCompletion){
        
        guard let data = data else {
            //error occurded, notify completion
            respond(with: nil, error: error, completion: completion)
            return
        }
        
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            //parsing failed
            //1. print raw string
            print(String(data: data, encoding: .utf8) ?? "empty data")
            //2. return error to completion
            let err = NSError(domain: "myapp.com", code: 13, userInfo: [NSLocalizedDescriptionKey:"error happened contact support"]) as Error
            respond(with: nil, error: err, completion: completion)
            
            return
        }
        
        //In real life, validate response here
        
        //done!
        respond(with: obj, error: nil, completion: completion)
        
        
    }
    
    private func respond(with result : Any?, error : Error?, completion : @escaping AppRequestCompletion){
        
        func done(){
            completion(result, error)
        }
        
        if respondOnMainThread{
            DispatchQueue.main.async(execute: done)
        } else {
            done()
        }
        
    }
    
    private func createRequest() -> URLRequest{
        let urlString = type.urlString()
        
        var paramString = ""
        for (key,val) in params{
            paramString += key
            paramString += "="
            paramString += "\(val)&"
        }
        
        var request : URLRequest!
        if type.isPost(){
            let url = URL(string: urlString)!
            request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
            request.httpMethod = "POST"
            request.httpBody = paramString.data(using: .utf8)
            
        } else {//GET
            let url = URL(string: urlString + "?" + paramString)!
            request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        }
        
        //in case of need to send header paramteres
        //request.addValue("42", forHTTPHeaderField: "user_id")
        
        return request
    }
    
    //MARK: - Params
    func add(date : Date, key : String){
        //unix time stamp
        params[key] = Int(date.timeIntervalSince1970)
    }
    
    func add(string : String, key : String){
        if let escapedString = string.escapedString(){
            params[key] = escapedString
        } else {
            print("unable to escaped \(string)")
        }
    }
    
    func add(bool : Bool, key : String){
        params[key] = bool// ? 1 : 0
    }
    
    func add(int : Int, key : String){
        params[key] = int
    }
    
    func add(double : Double, key : String){
        params[key] = double
    }
}







