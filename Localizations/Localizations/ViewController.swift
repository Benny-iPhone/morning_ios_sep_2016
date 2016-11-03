//
//  ViewController.swift
//  Localizations
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localizeUI()
    }

    func localizeUI(){
        label1.text = LocalizedKey.viewControllerLabel1.localizedString()
        label2.text = LocalizedKey.viewControllerLabel2.localizedString()
    }

}








