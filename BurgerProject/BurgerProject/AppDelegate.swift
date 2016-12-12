//
//  AppDelegate.swift
//  BurgerProject
//
//  Created by Benny Davidovitz on 12/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit
import MFSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let center = window!.rootViewController! //tab-bar-controller
        let right = storyboard.instantiateViewController(withIdentifier: "right")
        let left = storyboard.instantiateViewController(withIdentifier: "left")
        
        let container = MFSideMenuContainerViewController.container(withCenter: center, leftMenuViewController: left, rightMenuViewController: right)
        
        window?.rootViewController = container
        
        
        return true
    }

    


}



















