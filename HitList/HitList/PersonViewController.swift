//
//  PersonViewController.swift
//  HitList
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    //MARK: - IBAction
    @IBAction func addAction(_ sender: Any) {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
        !(firstName.isEmpty && lastName.isEmpty)
        else {
            return
        }
        //create
        let person = Person()
        //update
        person.first_name = firstName
        person.last_name = lastName
        //save
        DBManager.manager.saveContext()
        
        firstNameTextField.text = ""
        lastNameTextField.text = ""
    }

}







