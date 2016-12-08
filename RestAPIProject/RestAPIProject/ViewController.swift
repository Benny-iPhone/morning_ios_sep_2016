//
//  ViewController.swift
//  RestAPIProject
//
//  Created by Benny Davidovitz on 08/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func commentsAction(_ sender: Any) {
        
        let request = AppRequest(type: .comments)
        request.add(string: nameTextField.text!, key: "postId")
        
        request.send { (result, err) in
            if let result = result{
                print(result)
            }
        }
        
    }
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func demoRequestAction(_ sender: Any) {
        textField.resignFirstResponder()
        
        let request = AppRequest(type: .posts)
        if let userID = Int(textField.text!){
            request.add(int: userID, key: "userId")
        }
        
        request.send { (result, error) in
            if let arr = result /*as? [[String:Any]]*/{
                print(arr)
            }
        }
        
        /*
        var urlString = "https://jsonplaceholder.typicode.com/posts"
        if let userID = Int(textField.text!){
            urlString += "?userId=\(userID)"
        }

        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: {data, response,error in
        
            if let err = error{
                print(err)
            }
            
            if let data = data
                {
                    //for debug
                let str = String(data: data, encoding: .utf8)
                print(str!)
                    //for work
                    let obj = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String:Any]]
                print(obj!)
                    
                
            }
        }).resume()
        */
    }
    


}













