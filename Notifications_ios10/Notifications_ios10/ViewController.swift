//
//  ViewController.swift
//  Notifications_ios10
//
//  Created by hackeru hackeru on 19/12/2016.
//  Copyright © 2016 hackeru. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINotificationManager.manager
        
        var timestamp = Date().timeIntervalSince1970
        timestamp -= timestamp.truncatingRemainder(dividingBy: 60)
        timestamp += 60
        let date = Date(timeIntervalSince1970: timestamp)
        
        datePicker.date = date
        datePicker.minimumDate = date
    }
    
    @IBAction func tapAction(_ sender: Any) {
        textField.resignFirstResponder()
    }

    
    @IBAction func addLocalNotificationAction(_ sender: Any) {
        tapAction(sender)
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        UINotificationManager.manager.addNotification(text: text, at: datePicker.date)
    }
   

}






