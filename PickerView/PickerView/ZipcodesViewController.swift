//
//  ZipcodesViewController.swift
//  PickerView
//
//  Created by Benny Davidovitz on 17/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class ZipcodesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    enum Comp : Int{
        case state
        case zipcodes
        
        static let count = 2
    }
    
    let bigData : [String:[String]]
    let allStates : [String]
    var selectedState : String
    var currentZipcodes : [String]
    
    required init?(coder aDecoder: NSCoder) {
        let path = Bundle.main.path(forResource: "statedictionary", ofType: "plist")!
        let rawDict = NSDictionary(contentsOfFile: path)!
        bigData = rawDict as! [String:[String]]
        
        allStates = Array(bigData.keys).sorted(by: <)
        selectedState = allStates[0]
        currentZipcodes = bigData[selectedState]!
        
        super.init(coder: aDecoder)
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
        case .state:
            return allStates.count
        case .zipcodes:
            return currentZipcodes.count
        }
    }
    
    //MARK: - UIPickerView Delegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let c = Comp(rawValue: component) else {
            return nil
        }
        
        switch c {
        case .state:
            return allStates[row]
        case .zipcodes:
            return currentZipcodes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let c = Comp(rawValue: component),
            c == .state
        else {
            return
        }
        
        //refresh data
        selectedState = allStates[row]
        currentZipcodes = bigData[selectedState]!
        
        //refresh ui
        pickerView.reloadComponent(Comp.zipcodes.rawValue)
    }
}
























