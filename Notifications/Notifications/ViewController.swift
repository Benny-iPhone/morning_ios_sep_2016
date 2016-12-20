//
//  ViewController.swift
//  Notifications
//
//  Created by Benny Davidovitz on 15/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    @IBOutlet weak var soundSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var badgeStepper: UIStepper!
    @IBOutlet weak var badgeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var timestamp = Date().timeIntervalSince1970 //10:01:15
        timestamp -= timestamp.truncatingRemainder(dividingBy: 60) //10:01:00
        timestamp += 60 //10:02:00
        let date = Date(timeIntervalSince1970: timestamp)
        datePicker.date = date
        datePicker.minimumDate = date
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        badgeLabel.text = Int(sender.value).description
    }
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        titleTextField.resignFirstResponder()
        bodyTextField.resignFirstResponder()
    }
    
    @IBAction func scheduleAction(_ sender: UIButton) {
        guard let alertTitle = titleTextField.text, !alertTitle.isEmpty else {
            return
        }
        let notification = UILocalNotification()
        notification.fireDate = datePicker.date
        notification.alertTitle = alertTitle
        notification.alertBody = bodyTextField.text
        //notification.soundName = UILocalNotificationDefaultSoundName
        let index = soundSegmentedControl.selectedSegmentIndex
        notification.soundName = "sound\(index).mp3"
        
        notification.applicationIconBadgeNumber = Int(badgeStepper.value)
        
        notification.userInfo = ["event_id":42]
        notification.category = "cat"
        
        UIApplication.shared.scheduleLocalNotification(notification)
        
        /*
        if #available(iOS 10.0, *) {
            _ = UNUserNotificationCenter.current()
        } else {
            // Fallback on earlier versions
        }
        */
    }
    
}
















