//
//  FoodCell.swift
//  MenuTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodDescLabel: UILabel!
    
    static let identifier = "cell"
    
    static func heightFor(_ obj : Food, tableWidth : CGFloat) -> CGFloat{
        guard let text = obj.desc else {
            return 100
        }
        
        let topMargin : CGFloat = 33
        let bottomMargin : CGFloat = 4
        
        
        //max size available for text
        let size = CGSize(width: tableWidth - 8 - 16 - 92 - 8, height: CGFloat.greatestFiniteMagnitude)
        
        let options : NSStringDrawingOptions = [
            .usesLineFragmentOrigin,
            .usesFontLeading
        ]
        
        let pStyle = NSMutableParagraphStyle()
        pStyle.alignment = .natural
        pStyle.lineBreakMode = .byWordWrapping
        
        let atts = [
            NSFontAttributeName:UIFont.systemFont(ofSize: 16),
            NSParagraphStyleAttributeName:pStyle
        ]
        
        let rect = (text as NSString).boundingRect(with: size, options: options, attributes: atts, context: nil)
        
        let textHeight : CGFloat = rect.height
        
        return max(topMargin + textHeight + bottomMargin, 100)
    }
    
    func configure(_ obj : Food){
        foodTitleLabel.text = obj.title
        foodDescLabel.text = obj.desc
        
        if let url = obj.url{
            foodImageView.sd_setImage(with: url)
        } else {
            foodImageView.image = nil
            foodImageView.sd_cancelCurrentImageLoad()
        }
    }
    

}












