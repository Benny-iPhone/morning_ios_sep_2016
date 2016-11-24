//
//  SettingsTableViewCell.swift
//  CellFromXIB
//
//  Created by Benny Davidovitz on 24/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

protocol SettingsTableViewCellDelegate {
    func settingsTableViewCell(_ cell : SettingsTableViewCell, didChangeState state : Bool)
}

class SettingsTableViewCell: UITableViewCell {

    enum Row : Int{
        case sound
        case wifiOnly
        
        static let count = 2
        
        func title() -> String{
            switch self{
            case .sound: return "Sound 🔊"
            case .wifiOnly: return "wifi only 🗼"
            }
        }
    }
    
    var delegate : SettingsTableViewCellDelegate?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var actionSwitch: UISwitch!
    
    
    static func nib() -> UINib{
        return UINib(nibName: "SettingsTableViewCell", bundle: Bundle.main)//nil)
    }
    
    static func reuseIndntifier() -> String{
        return "switch_cell"
    }
    
    func configure(_ row : Row, info : Bool){
        label.text = row.title()
        actionSwitch.isOn = info
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        //tell new state to delegate if exist
        delegate?.settingsTableViewCell(self, didChangeState: sender.isOn)
    }
}











