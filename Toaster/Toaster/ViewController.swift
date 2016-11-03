//
//  ViewController.swift
//  Toaster
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import Toast

class ViewController: UIViewController {

    @IBAction func showToastAction(_ sender: AnyObject) {
        
        self.view.makeToast("Toast Test 123")
        //ToastLabel.show(with: "Toast Test Text")
        
        //ToastLabel.show(with: "Test")
        
    }
    


}

