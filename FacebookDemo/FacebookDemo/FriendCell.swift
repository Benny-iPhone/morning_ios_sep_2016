//
//  FriendCell.swift
//  FacebookDemo
//
//  Created by Benny Davidovitz on 15/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class FriendCell: UITableViewCell {

    static let identifier = "cell"
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var profilePicImageView : UIImageView!
    
    func configure(friend : Friend){
        nameLabel.text = friend.name
        if let url = friend.imageURL{
            profilePicImageView.sd_setImage(with: url)
        } else {
            profilePicImageView.image = nil
            profilePicImageView.sd_cancelCurrentImageLoad()
        }
    }
}





