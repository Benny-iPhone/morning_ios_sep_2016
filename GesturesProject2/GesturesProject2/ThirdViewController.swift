//
//  ThirdViewController.swift
//  GesturesProject2
//
//  Created by Benny Davidovitz on 13/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        
        sender.view?.transform = CGAffineTransform(rotationAngle: sender.rotation)
        //CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
