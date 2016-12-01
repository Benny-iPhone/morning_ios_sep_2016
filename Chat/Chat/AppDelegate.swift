//
//  AppDelegate.swift
//  Chat
//
//  Created by Benny Davidovitz on 01/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()

        FlowController.controller.updateRoot()
        
//        if let name = FIRAuth.auth()?.currentUser?.displayName{
//            print(name)
//        }
        
        return true
    }

    


}
























