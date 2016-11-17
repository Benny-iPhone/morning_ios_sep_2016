//
//  SingleViewController.swift
//  PickerView
//
//  Created by Benny Davidovitz on 17/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var singlePickerView: UIPickerView!

    let pickerArray : [String] = [
        "Siera","El Capitan","Yosemite","Mavericks","Mountain Lion","Lion","Snow Leopard","Leopard","Tiger","Panther","Jaguar","Puma"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView(singlePickerView, didSelectRow: 0, inComponent: 0)
    }

    //MARK: - UIPickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    //MARK: - UIPickerView Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        label.text = pickerArray[row]
        
    }

}
















