//
//  SectionHeaderView.swift
//  DropDownTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .orange
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "SectionHeaderView", bundle: nil)
    }
    
    static let identifier = "header"

}
