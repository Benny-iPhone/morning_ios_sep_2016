//
//  ViewController.swift
//  MyCoolApp
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func showAction(_ sender: Any) {
        
        AdManager.manager.tryToShowAd()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

