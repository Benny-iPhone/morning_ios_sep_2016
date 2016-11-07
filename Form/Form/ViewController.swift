//
//  ViewController.swift
//  Form
//
//  Created by Benny Davidovitz on 07/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var lastNameTextField: AppTextField!
    @IBOutlet weak var firstNameTextField: AppTextField!
    
    
    @IBAction func tapAction(_ sender: Any) {
        //firstNameTextField.resignFirstResponder()
        _ = self.view.hideKeyboard()
    }
    
    @IBAction func textFieldDidEndOnExitAction(_ sender: UITextField) {
        
        if let nextTextField = self.view.viewWithTag(sender.tag + 1) as? UITextField{
            
            nextTextField.becomeFirstResponder()
            
        } else {
            doneAction(sender)
        }
        
    }
    
    @IBAction func doneAction(_ sender: Any) {
        tapAction(sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstNameTextField.becomeFirstResponder()
        lastNameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//MARK: - UITextFieldDelegate -
extension ViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    /*
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == lastNameTextField{
            let firstName = firstNameTextField.text ?? ""
            return firstName.isEmpty == false
        }
        
        return true
    }*/
}
















