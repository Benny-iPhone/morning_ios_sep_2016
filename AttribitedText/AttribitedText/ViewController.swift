//
//  ViewController.swift
//  AttribitedText
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arc4random_uniform(36)
        
        /*
        labels.sort {return $0.tag < $1.tag}
 */
        labels.sort { (lbl1, lbl2) -> Bool in
            return lbl1.tag < lbl2.tag
        }
        
        for (i,lbl) in labels.enumerated(){
            lbl.text = i.description
        }
        
        
        
        let myString = "Moran Levi"
        
        let font = UIFont(name: "Georgia", size: 18)!
        
        let atts : [String:Any] = [
            NSFontAttributeName:font,
            NSForegroundColorAttributeName:UIColor.blue
        ]
        
        let boldFont = UIFont.boldSystemFont(ofSize: 18)
        let boldColor = UIColor.black
        let boldAtts = [
            NSFontAttributeName:boldFont,
            NSForegroundColorAttributeName:boldColor
            ]
        
        let attString = NSMutableAttributedString(string: myString, attributes: atts)
        
        for (index,ch) in myString.characters.enumerated(){
            if ch.isVowel(){
                attString.addAttributes(boldAtts, range: NSRange(location: index, length: 1))
            }
        }
        
        /*
        for i in myString.characters.indices[myString.startIndex..<myString.endIndex]{
            
            let ch : Character = myString[i]
            if ch.isVowel(){
                let index = myString.distance(from: myString.startIndex, to: i)
                let range = NSRange(location: index, length: 1)
                attString.addAttributes(boldAtts, range: range)
            }
            
        }
        */
        
        titleLabel.attributedText = attString
        
    }



}











