//
//  ViewController.swift
//  Form
//
//  Created by Benny Davidovitz on 07/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var topLayoutInitiateY : CGFloat!
    
    @IBOutlet weak var stackViewTopLayout: NSLayoutConstraint!
    @IBOutlet weak var lastNameTextField: AppTextField!
    @IBOutlet weak var firstNameTextField: AppTextField!
    
    @IBOutlet weak var emailTextField: AppTextField!
    
    @IBAction func tapAction(_ sender: Any) {
        //firstNameTextField.resignFirstResponder()
        _ = self.view.hideKeyboard()
        changeTopBy(0)
    }
    
    @IBAction func textFieldDidEndOnExitAction(_ sender: UITextField) {
        
        if let nextTextField = self.view.viewWithTag(sender.tag + 1) as? UITextField{
            
            nextTextField.becomeFirstResponder()
            
        } else {
            doneAction(sender)
        }
        
    }
    
    @IBAction func textFieldChangedAction(_ sender : AppTextField){
        sender.showWarning = false
    }
    
    @IBAction func doneAction(_ sender: Any) {
        tapAction(sender)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //read default value from storyboard
        topLayoutInitiateY = stackViewTopLayout.constant
        
        firstNameTextField.becomeFirstResponder()
        //lastNameTextField.delegate = self
        
    }

    
}


//MARK: - UITextFieldDelegate -
extension ViewController : UITextFieldDelegate{
    
    func changeTopBy(_ y : CGFloat){
        //dont do anything if nothing changed
        guard stackViewTopLayout.constant != topLayoutInitiateY - y else {
            return
        }
        
        stackViewTopLayout.constant = topLayoutInitiateY - y
       
        func animateFunc(){
            //refresh constraints
            self.view.layoutSubviews()
        }
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: animateFunc, completion: nil)
        //UIView.animate(withDuration: 0.7, animations: animateFunc)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let y = textField.frame.origin.y - firstNameTextField.frame.origin.y

        changeTopBy(y)
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let textField = textField as? AppTextField else{
            return true
        }
        
        let text = textField.text ?? ""
        
        switch textField {
        case firstNameTextField:
            textField.showWarning = text.isEmpty
        case emailTextField:
            textField.showWarning = !text.isValidEmail()
        default:
            break
        }
        
        
        
        return !textField.showWarning

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
















