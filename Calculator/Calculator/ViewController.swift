//
//  ViewController.swift
//  Calculator
//
//  Created by Benny Davidovitz on 06/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonWidthLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultLabel: UILabel!
    
    let brain : Brain// = Brain()
    required init?(coder aDecoder: NSCoder) {
        brain = Brain()
        super.init(coder: aDecoder)
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        
        let digit : Int = sender.tag
        let str = "\(digit)"
        resultLabel.text = brain.add(digit: str)
        /*
        var text = resultLabel.text ?? ""
        text += "\(digit)"
        
        resultLabel.text = text
        */
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        guard let op = Operator(rawValue: sender.tag) else {
            print("unsupported raw value \(sender.tag)")
            return
        }
        
        resultLabel.text = brain.add(operator: op)
        
    }
    
    @IBAction func clearAction(_ sender: AnyObject) {
        resultLabel.text = brain.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = nil
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        adjustButtonsLayout()
    }

    //a method to adjust buttons width & height
    func adjustButtonsLayout(){
        let size = min(view.bounds.width, view.bounds.height) * 0.1875
        
        buttonWidthLayoutConstraint.constant = size
        buttonHeightLayoutConstraint.constant = size
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

