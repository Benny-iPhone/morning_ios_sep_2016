//
//  SectionHeaderTapGestureRecognizer.swift
//  DropDownTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SectionHeaderTapGestureRecognizer: UITapGestureRecognizer {

    let sectionIndex : Int
    
    init(target: Any?, action: Selector?, sectionIndex : Int) {
        self.sectionIndex = sectionIndex
        super.init(target: target, action: action)
    }
    
}
