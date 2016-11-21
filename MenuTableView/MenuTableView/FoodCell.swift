//
//  FoodCell.swift
//  MenuTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodDescLabel: UILabel!
    
    static let identifier = "cell"
    
    func configure(_ obj : Food){
        foodTitleLabel.text = obj.title
        foodDescLabel.text = obj.desc
    }
    

}








