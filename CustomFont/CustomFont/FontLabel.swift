//
//  FontLabel.swift
//  CustomFont
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class FontLabel: UILabel {

    private func initialize(){
        textColor = UIColor.red
        shadowColor = .black
        shadowOffset = CGSize(width: 1, height: 1)
        
        font = UIFont(name: "IndieFlower", size: 40)
        //UIFont.italicSystemFont(ofSize: 60)
        //UIFont.boldSystemFont(ofSize: 24)
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













