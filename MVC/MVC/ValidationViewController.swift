//
//  ValidationViewController.swift
//  MVC
//
//  Created by hackeru on 26 Elul 5776.
//  Copyright © 5776 hackeru. All rights reserved.
//

import UIKit

class ValidationViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    //IBAction
    
    @IBAction func textFieldDidEndOnExitAction(_ sender: UITextField) {
        /*
        if let text = sender.text{
            label.text = text.isEmail ? "valid email" : "not valid email"
        } else {
            label.text = nil
            return
        }
        */
        
        guard let text = sender.text else {
            //if text nil - clear label
            label.text = nil
            return
        }
        
        label.text = text.isEmail ? "valid email" : "not valid email"
        
        
        
    }
    
    //step 1 - init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //step2 - view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //clear label
        label.text = nil
        //open keyboard
        emailTextField.becomeFirstResponder()
    }

    //contraints implementation affect
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //before showing itself
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //after showing itself
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    //before un-showing
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //will un-showing
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //release
    deinit {
        
    }
}










