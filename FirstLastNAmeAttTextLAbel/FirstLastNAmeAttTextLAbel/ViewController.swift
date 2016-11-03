//
//  ViewController.swift
//  FirstLastNAmeAttTextLAbel
//
//  Created by Benny Davidovitz on 03/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let name = "Tom Zerach Ben-Ari"
        let firstName = "Tom Zerach"
        let lastName = "Ben Ari Abargil"
        
        let fullName = firstName + " " + lastName
        let range : NSRange = (fullName as NSString).range(of: lastName)
        
        let attString = NSMutableAttributedString(string: fullName)
        attString.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFont(ofSize: 24), range: range)
        attString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: range)
        
        label.attributedText = attString
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














