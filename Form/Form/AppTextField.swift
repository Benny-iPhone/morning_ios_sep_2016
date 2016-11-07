//
//  AppTextField.swift
//  Form
//
//  Created by Benny Davidovitz on 07/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class AppTextField: UITextField {

    fileprivate func initialize(){
        font = UIFont(name: "Georgia", size: 16)
        textColor = .purple
        
        clearsOnBeginEditing = false
        clearButtonMode = .whileEditing
        spellCheckingType = .no
        autocorrectionType = .no
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
}

class PasswordTextField : AppTextField{
    fileprivate override func initialize() {
        super.initialize()
        
        isSecureTextEntry = true
        textColor = .black
        clearButtonMode = .never
    }
}






















