//
//  FoodDetailsViewController.swift
//  MenuTableView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController {

    var food : Food!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = food.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
