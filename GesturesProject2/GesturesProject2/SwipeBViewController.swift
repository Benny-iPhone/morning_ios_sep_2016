//
//  SwipeBViewController.swift
//  GesturesProject2
//
//  Created by Benny Davidovitz on 13/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SwipeBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //let swipeBackGesture = UISwipeGestureRecognizer(target: self, action: "swipeBackAction:")
        let swipeBackGesture = UISwipeGestureRecognizer(target: self, action: #selector(SwipeBViewController.swipeBackAction(_:)))
        swipeBackGesture.direction = .right
        view.addGestureRecognizer(swipeBackGesture)
    }
    
    func swipeBackAction(_ sender : AnyObject){
        _ = self.navigationController?.popViewController(animated: true)
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
