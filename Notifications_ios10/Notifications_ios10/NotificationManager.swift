//
//  NotificationManager.swift
//  Notifications_ios10
//
//  Created by hackeru hackeru on 19/12/2016.
//  Copyright © 2016 hackeru. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class UINotificationManager: NSObject {
    static let manager = UINotificationManager()
    
    override init() {
        super.init()
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .carPlay, .sound], completionHandler: { success, error in
            
            if let error = error{
                print(error)
            }
            
        })
    }
    
    
    func addNotification(text : String, at date : Date){
        let comps : DateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: date)
        
        let newComps = DateComponents(calendar: .current, timeZone: .current, month: comps.month, day: comps.day, hour: comps.hour, minute: nil, second: 0, nanosecond: 0)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComps, repeats: false)
        
        let content = self.content(with: text)
        let request = UNNotificationRequest(identifier: "42", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {
            
            if let err = $0{
                print(err)
            }
        })
        
        let action = UNNotificationAction(identifier: "later", title: "later", options: [])
        let category = UNNotificationCategory(identifier: "myNotificationCategory", actions: [action], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
 
    }
    
    func content(with text : String) -> UNNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = "Friendly Reminder"
        content.body = text
        content.sound = UNNotificationSound.default()
        //UNNotificationSound(named: "sound.mp3")
        //photo
        /*
        if let url = Bundle.main.url(forResource: "logo", withExtension: "png"),
            let attchment = try? UNNotificationAttachment(identifier: "logo", url: url, options: nil){
            content.attachments = [attchment]
        }*/
        //video
        if let url = Bundle.main.url(forResource: "video", withExtension: "mp4"),
            let attchment = try? UNNotificationAttachment(identifier: "vid", url: url, options: nil){
            content.attachments = [attchment]
        }
        content.categoryIdentifier = "myNotificationCategory"
        
        return content
    }
}









