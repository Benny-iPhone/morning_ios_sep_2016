//
//  FourthViewController.swift
//  GesturesProject2
//
//  Created by Benny Davidovitz on 13/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        
        switch sender.state {
        case .began, .changed:
            //update transform
            sender.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
        default:
            //ended, failed, ready..
            //set back to initial value
            UIView.animate(withDuration: 0.3, animations: { 
                sender.view?.transform = CGAffineTransform.identity
            })
            
        }
        
        /*
        guard let oldTransform = sender.view?.transform else {
            print("view is nil, check this out")
            return
        }
        
        let newTransform = oldTransform.scaledBy(x: scale, y: scale)
        sender.view?.transform = newTransform
        */
        //sender.view?.transform = sender.view?.transform.scaledBy(x: scale, y: scale) ?? CGAffineTransform.identity
        
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
