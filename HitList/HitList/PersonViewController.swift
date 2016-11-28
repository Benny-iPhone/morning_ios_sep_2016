//
//  PersonViewController.swift
//  HitList
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    var person : Person?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person{
            //update mode
            firstNameTextField.text = person.first_name
            lastNameTextField.text = person.last_name
            title = "Update Person"
            actionButton.setTitle("Update To database", for: .normal)
        } else {
            //create mode
            title = "Add Person"
            actionButton.setTitle("Add To database", for: .normal)
        }
    }
    
    //MARK: - IBAction
    @IBAction func buttonAction(_ sender: AnyObject) {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
        !(firstName.isEmpty && lastName.isEmpty)
        else {
            return
        }
        //update or create
        let personObject = person ?? Person()
        //update
        personObject.first_name = firstName
        personObject.last_name = lastName
        //save
        DBManager.manager.saveContext()

        _ = navigationController?.popViewController(animated: true)
//        firstNameTextField.text = ""
//        lastNameTextField.text = ""
    }

}







