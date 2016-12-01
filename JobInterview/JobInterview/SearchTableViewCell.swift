//
//  SearchTableViewCell.swift
//  JobInterview
//
//  Created by Benny Davidovitz on 28/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    static let identifier = "cell"
    
    func configure(_ item : Item){
        nameLabel.text = item.title
        yearLabel.text = item.year
        
        if let url = item.poster{
            posterImageView.sd_setImage(with: url)
        } else {
            posterImageView.sd_cancelCurrentImageLoad()
            posterImageView.image = nil
        }
    }
}












