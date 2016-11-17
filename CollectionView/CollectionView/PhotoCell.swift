//
//  PhotoCell.swift
//  CollectionView
//
//  Created by Benny Davidovitz on 17/11/2016.
//  Copyright © 2016 hackeru . All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    
    static let identifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.backgroundColor = .white
    }
    
    func configure(with image : UIImage){
        imageView.image = image
    }
}






