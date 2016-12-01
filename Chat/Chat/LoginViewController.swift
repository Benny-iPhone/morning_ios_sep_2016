//
//  LoginViewController.swift
//  Chat
//
//  Created by Benny Davidovitz on 01/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
    }
    
    //MARK: - IBAction
    @IBAction func startAction(_ sender: Any) {
        guard let name = textField.text,
            !name.isEmpty
        else {
            return
        }
        
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in

            if let error = error{
                print(error)
            } else {
                self.updateName(name)
            }
            
        })
    }
    
    func updateName(_ name : String){
        let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges() { (error) in
            //change storyboard is needs
            FlowController.controller.determineRoot()
        }
    }


    
}






