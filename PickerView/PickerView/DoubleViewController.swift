//
//  DoubleViewController.swift
//  PickerView
//
//  Created by Benny Davidovitz on 17/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class DoubleViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    enum Comp : Int {
        case firstNames = 1
        case lastNames = 0
        
        static let count = 2
    }
    
    @IBOutlet weak var contentPickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let firstNames = ["Asher","Avner","Itay","Vitali"]
    let lastNames = ["Efrati","Cohen","Akbarov"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - UIPickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Comp.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        guard let c = Comp(rawValue: component) else {
            return 0
        }
        
        switch c {
        case .firstNames:
            return firstNames.count
        case .lastNames:
            return lastNames.count
        }
    }

    //MARK: - UIPickerView Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        guard let c = Comp(rawValue: component) else {
            return nil
        }
        
        switch c {
        case .firstNames:
            return firstNames[row]
        case .lastNames:
            return lastNames[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let firstNameIndex = pickerView.selectedRow(inComponent: Comp.firstNames.rawValue)
        let first = firstNames[firstNameIndex]
        
        let lastNameIndex = pickerView.selectedRow(inComponent: Comp.lastNames.rawValue)
        let last = lastNames[lastNameIndex]
        
        label.text = first + " " + last
        
        
    }
    

}























