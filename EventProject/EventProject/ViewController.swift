//
//  ViewController.swift
//  EventProject
//
//  Created by Benny Davidovitz on 26/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

/*
 Event's Model - V
 Toast - V
 override date picker for creating editingDidBeginEvent - X
 3rd party code for calendar - V
 event's info using UITextFields - V
 */

class ViewController: UIViewController {

    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var dateTextField: DateTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventNameTextField.becomeFirstResponder()
        _ = EventManager.manager
    }
    
    @IBAction func tapAction(_ sender: AnyObject) {
        eventNameTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func addEventAction(_ sender: Any) {
        
        guard let name = eventNameTextField.text, !name.isEmpty else {
            "type name".toast()
            return
        }
        
        EventManager.manager.addEvent(with: name, startingAt: dateTextField.selectedDate, completion: {error in
            if let error = error{
                //failed
                error.localizedDescription.toast()
            } else {
                //success
                "success".toast()
            }
        })
        
    }
    


}













