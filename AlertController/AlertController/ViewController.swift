//
//  ViewController.swift
//  AlertController
//
//  Created by Benny Davidovitz on 14/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAnnoyingAlert(_ sender: Any) {
        
        let controller = UIAlertController(title: "Alert", message: "test message", preferredStyle: UIAlertControllerStyle.alert)
        
        //add ok button
        func handler(_ action : UIAlertAction){
            print("ok")
        }
   
        let action = UIAlertAction(title: "ok", style: .default, handler: handler)
        
        /*
        let action = UIAlertAction(title: "ok", style: .default, handler: { _ in
            print("ok")
        })
 */
            //UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        controller.addAction(action)
        
        present(controller, animated: true, completion: nil)
        
    }
    

    @IBAction func showTwoButtonsAlert(_ sender: Any) {
        
        let controller = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .alert)
        
        func handler(_ action : UIAlertAction){
            if let text = controller.textFields?.first?.text{
                print(text)
            }
            print(action.title ?? "")
        }
        
        controller.addAction(UIAlertAction(title: "yes", style: .default, handler: handler))
        controller.addAction(UIAlertAction(title: "no", style: .cancel, handler: handler))
        /*
        //controller.addTextField(configurationHandler:  nil)
        controller.addTextField(configurationHandler: {
            //$0 is the UITextField
            $0.placeholder = "type your name"
        })
        */
        present(controller, animated: true, completion: nil)
        
    }
    
    //user
    //P455W0RD
    
    @IBAction func showLoginAlert(_ sender : AnyObject){
        
        let alertController = UIAlertController(title: "Sign In", message: nil, preferredStyle: .alert)
        
        func handler(_ action : UIAlertAction){
            //no cancel button
            guard action.style == .default else {
                return
            }

            guard let textFields = alertController.textFields,
                textFields.count == 2,
                let username = textFields[0].text,
                let password = textFields[1].text
            else {
                print("textfields structure is not valid")
                return
            }
            
            if username == "user" && password == "P455W0RD"{
                print("success")
            } else {
                print("wrong credentials")
            }
            
            
        }
        
        alertController.addAction(UIAlertAction(title: "later", style: .cancel, handler: handler))
        alertController.addAction(UIAlertAction(title: "go", style: .default, handler: handler))
        
        alertController.addTextField(configurationHandler: {
            $0.placeholder = "username"
        })
        
        alertController.addTextField(configurationHandler: {
            $0.placeholder = "password"
            $0.isSecureTextEntry = true
        })
        
        present(alertController, animated: true, completion: nil)
        
    }

}


























