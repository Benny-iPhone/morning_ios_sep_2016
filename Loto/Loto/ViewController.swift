//
//  ViewController.swift
//  Loto
//
//  Created by Benny Davidovitz on 31/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberLabels: [UILabel]!

    @IBOutlet weak var strongNumberLabel: UILabel!
    
    @IBAction func rollAction(_ sender: UIButton) {
        sender.isEnabled = false
        
        //clear
        for label in numberLabels{
            label.text = ""
        }
        
        strongNumberLabel.text = ""
        
        //build new array
        var arr : [Int] = []
        for i in 1...36{
            arr.append(i)
        }
        
        //select and show
        var delay = 0.2
        let interval = 0.2
        
        for label in numberLabels{
            let index = Int(arc4random_uniform(UInt32(arr.count)))
            let number = arr.remove(at: index)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { 
                label.text = number.description // === "\(number)"
            })
            
            delay += interval
            
        }
        
        //show strong number
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            let strongNumber = Int(arc4random_uniform(10)) + 1
            self.strongNumberLabel.text = strongNumber.description
        }
        
        delay += interval
        
        //re-enable button
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { 
            sender.isEnabled = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabels.sort(by: {$0.tag < $1.tag})
    }
    
   


}













