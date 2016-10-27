//
//  LongPressViewController.swift
//  LongPressWithColor
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class LongPressViewController: UIViewController {
    
    let colors : [UIColor] = [.black, .red, .green, .blue, .purple, .orange]
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        
        guard
            let redView = sender.view,
            sender.state == .ended
            else {
                return
        }
        
        
        let index = Int(arc4random_uniform(UInt32(colors.count)))
        //let index = Int(arc4random()) % colors.count
        redView.backgroundColor = colors[index]
        
        /*
        let redValue = CGFloat(arc4random() % 256) / 255
        let blueValue = CGFloat(arc4random() % 256) / 255
        let greenValue = CGFloat(arc4random() % 256) / 255
        
        let nextColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        redView.backgroundColor = nextColor
        */
        
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
