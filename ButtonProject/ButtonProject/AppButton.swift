//
//  AppButton.swift
//  ButtonProject
//
//  Created by Benny Davidovitz on 10/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class AppButton: UIButton {

    private func initialize(){
        setTitleColor(.blue, for: .normal)
        setTitleColor(.yellow, for: .highlighted)
        setTitleColor(.red, for: .disabled)
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
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
