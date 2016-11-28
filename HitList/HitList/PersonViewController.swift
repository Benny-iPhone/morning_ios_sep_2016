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
    
    @IBOutlet weak var birthdateTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = person{
            //update mode
            firstNameTextField.text = person.first_name
            lastNameTextField.text = person.last_name
            imageView.image = person.image
            
            
            title = "Update Person"
            actionButton.setTitle("Update To database", for: .normal)
        } else {
            //create mode
            title = "Add Person"
            actionButton.setTitle("Add To database", for: .normal)
        }
        
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(PersonViewController.takePictureAction(_:)))
        navigationItem.rightBarButtonItem = cameraButton
    }
    
    //MARK: - IBAction
    
    @IBAction func closeKeyboard(_ sender: Any) {
        
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        birthdateTextField.resignFirstResponder()
        
    }
    
    @IBAction func takePictureAction(_ sender: AnyObject) {
        closeKeyboard(sender)
        
        let alertController = UIAlertController(title: "select source", message: nil, preferredStyle: .actionSheet)
        
        func handler(_ action : UIAlertAction){
            guard let actionTitle = action.title else {
                return
            }
            
            let controller = UIImagePickerController()
            controller.delegate = self
            
            switch actionTitle {
            case "Camera":
                controller.sourceType = .camera
            case "Photo Library":
                controller.sourceType = .photoLibrary
            default:
                return
            }
            
            self.present(controller, animated: true, completion: nil)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: handler))
        }
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: handler))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
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
        personObject.image = imageView.image
        
        //save
        DBManager.manager.saveContext()

        _ = navigationController?.popViewController(animated: true)
//        firstNameTextField.text = ""
//        lastNameTextField.text = ""
    }

}

extension PersonViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}

















