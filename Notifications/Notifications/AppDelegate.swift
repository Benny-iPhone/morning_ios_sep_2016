//
//  AppDelegate.swift
//  Notifications
//
//  Created by Benny Davidovitz on 15/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import TWMessageBarManager
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         FIRApp.configure()
        
        let laterAction = UIMutableUserNotificationAction()
        laterAction.identifier = "later"
        laterAction.title = "מחר כך"
        laterAction.activationMode = .background
        laterAction.isDestructive = true
        laterAction.isAuthenticationRequired = true
        
        let showAction = UIMutableUserNotificationAction()
        showAction.identifier = "show"
        showAction.title = "תראה"
        showAction.activationMode = .foreground
        
        let replyAction = UIMutableUserNotificationAction()
        replyAction.identifier = "reply"
        replyAction.title = "השב"
        replyAction.activationMode = .background
        replyAction.behavior = .textInput
        replyAction.parameters = [
            UIUserNotificationTextInputActionButtonTitleKey:"שלח"
        ]
        
        
        let cat = UIMutableUserNotificationCategory()
        cat.identifier = "cat"
        cat.setActions([replyAction,laterAction,showAction], for: .default)
        
        application.applicationIconBadgeNumber = 0
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: [cat])
        application.registerUserNotificationSettings(settings)
        
        return true
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        
        if notificationSettings.types == UIUserNotificationType(rawValue: 0){
            print("not approved")
        } else {
            print("approved")
            application.registerForRemoteNotifications()
        }
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: .sandbox)
        
        let str = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print(str)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
        let event_id = notification.userInfo?["event_id"] as? Int
        print(event_id ?? "no event id found")
        
        switch application.applicationState {
        case .active:
            //forground
            let title = notification.alertTitle
            let body = notification.alertBody
            TWMessageBarManager.sharedInstance().showMessage(withTitle: title, description: body, type: .success)
            
        case .background:
            //background
            return
        case .inactive:
            //application close
            return
        }
    }
    /*
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
        if identifier == "later"{
            notification.fireDate = Date(timeIntervalSinceNow: 10)
            application.scheduleLocalNotification(notification)
        } else if identifier == "show"{
            let event_id = notification.userInfo?["event_id"]
            print("show \(event_id)")
        }
        
        completionHandler()
        
    }*/
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        
        if identifier == "later"{
            notification.fireDate = Date(timeIntervalSinceNow: 10)
            application.scheduleLocalNotification(notification)
        } else if identifier == "show"{
            let event_id = notification.userInfo?["event_id"]
            print("show \(event_id)")
        } else if identifier == "reply"{
            let text = responseInfo[UIUserNotificationActionResponseTypedTextKey] as? String
            print(text ?? "")
        }
        
        completionHandler()
        
    }

    //handle push interacted
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print(userInfo)
    }
    
    //handle push received for remote-notification background mode
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
        completionHandler(.newData)
    }
    
    //also handle text input
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    //background
    var bgIdentifier : UIBackgroundTaskIdentifier!
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        bgIdentifier = application.beginBackgroundTask(withName: "bg", expirationHandler: nil)
        
        DispatchQueue.global().async {
            application.endBackgroundTask(self.bgIdentifier)
            self.bgIdentifier = UIBackgroundTaskInvalid
        }
    }
    
}









