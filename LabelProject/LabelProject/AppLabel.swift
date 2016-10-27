//
//  AppLabel.swift
//  LabelProject
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class AppLabel: UILabel {

    func initialize(){
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        numberOfLines = 0
        textAlignment = .center
        textColor = .purple
        font = UIFont.boldSystemFont(ofSize: 24)
        backgroundColor = UIColor.gray.withAlphaComponent(0.4)
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







