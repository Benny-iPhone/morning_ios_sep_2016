//
//  ImageViewController.swift
//  AlertController
//
//  Created by Benny Davidovitz on 14/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func tapAction(_ sender: Any) {
        
        let controller = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        
        func handler(_ action : UIAlertAction){
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            
            switch action.title ?? ""{
            case "Rear Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .rear
            case "Front Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .front
            default:
                picker.sourceType = .savedPhotosAlbum
            }
            
            self.present(picker, animated: true, completion: nil)
            
        }
        
        controller.addAction(UIAlertAction(title: "Photo Album", style: .destructive, handler: handler))
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            if UIImagePickerController.isCameraDeviceAvailable(.rear){
                let rearCameraAction = UIAlertAction(title: "Rear Camera", style: .default, handler: handler)
                
                //un-docuemnted api, use with caution
                rearCameraAction.setValue(#imageLiteral(resourceName: "camera"), forKey: "image")
                
                controller.addAction(rearCameraAction)
            }
            
            if UIImagePickerController.isCameraDeviceAvailable(.front){
                controller.addAction(UIAlertAction(title: "Front Camera", style: .default, handler: handler))
            }
            
        }
        
        controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        
        present(controller, animated: true, completion: nil)
        
    }
    
    
    
}


extension ImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        imageView.image = editedImage ?? originalImage
        
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
}
























