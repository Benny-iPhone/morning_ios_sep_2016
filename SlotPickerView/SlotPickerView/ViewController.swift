//
//  ViewController.swift
//  SlotPickerView
//
//  Created by Benny Davidovitz on 21/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    let crunchPlayer : AVAudioPlayer?
    let winPlayer : AVAudioPlayer?
    
    let pickerArray : [UIImage] = [#imageLiteral(resourceName: "apple.png"),#imageLiteral(resourceName: "bar.png"),#imageLiteral(resourceName: "cherry.png"),#imageLiteral(resourceName: "seven.png"),#imageLiteral(resourceName: "crown"),#imageLiteral(resourceName: "lemon")]
    let rounds = 10
    
    @IBOutlet weak var slotPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        
        if let url = Bundle.main.url(forResource: "win", withExtension: "wav"){
            winPlayer = try? AVAudioPlayer(contentsOf: url)
        } else {
            self.winPlayer = nil
        }
        
        if let url = Bundle.main.url(forResource: "crunch", withExtension: "wav"){
            crunchPlayer = try? AVAudioPlayer(contentsOf: url)
        } else {
            self.crunchPlayer = nil
        }
        
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        slotPickerView.isUserInteractionEnabled = false
        
        let row = 10
        let comps = slotPickerView.numberOfComponents
        
        for i in 0..<comps{
            slotPickerView.selectRow(row, inComponent: i, animated: false)
        }
    }

    //MARK: - Helper
    
    func didWin() -> Bool{
        
        let comps = slotPickerView.numberOfComponents
        guard comps > 0 else {
            return true
        }
        
        let checkValue = slotPickerView.selectedRow(inComponent: 0) % pickerArray.count
        
        for i in 1..<comps{
            let value = slotPickerView.selectedRow(inComponent: i) % pickerArray.count
            
            if checkValue != value{
                return false
            }
            
        }

        return true
    }
    
    //MARK: - IBAction
    
    @IBAction func spinAction(_ sender: UIButton) {
        sender.isEnabled = false
        
        let comps = slotPickerView.numberOfComponents
        let maxVal = UInt32(pickerArray.count * (rounds - 2))
        let roundSize = pickerArray.count
        
        var delay = 0.0
        
        for i in 0..<comps{
            let row = Int(arc4random_uniform(maxVal)) + roundSize
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                self.crunchPlayer?.play()
                self.slotPickerView.selectRow(row, inComponent: i, animated: true)
            })
            
            delay += 0.5
            
        }
        
        let win = didWin()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
            sender.isEnabled = true
            
            if win{
                self.winPlayer?.play()
                self.resultLabel.text = "WIN"
            } else {
                self.resultLabel.text = "TRY AGAIN"
            }
            
        })
        
    }
   
    //MARK: - UIPickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count * rounds
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % pickerArray.count
        return UIImageView(image: pickerArray[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerArray[0].size.height
    }
}













