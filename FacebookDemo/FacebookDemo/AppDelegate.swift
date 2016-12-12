//
//  AppDelegate.swift
//  FacebookDemo
//
//  Created by Benny Davidovitz on 12/12/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

/*
 1. pod the SDK
 2. info.plist keys and values from the getting started (see link below)
 3. implement method in AppDelegate (see link below)
 4. Target -> Capabilities -> Keychain Sharing -> Toggle to On
 */

//https://developers.facebook.com/docs/ios/getting-started/
//obj-c
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//import FBSDKCoreKit
import FacebookCore
import FacebookLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //obj - c
        //[[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
        //swift
        //FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        //if FBSDKAccessToken.current() != nil
        
        if AccessToken.current != nil{
            //show Main Storyboard
            print("main")
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        } else {
            //show Login Storyboard
            print("login")
        }
        
        return true
    }

    /*
     //obj-c
    - (BOOL)application:(UIApplication *)application
    openURL:(NSURL *)url
    options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
    openURL:url
    sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
    annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
    ];
    // Add any custom logic here.
    return handled;
    }
 */
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //let sourceApp = options[.sourceApplication] as? String
        //let annotation = options[.annotation]
        
        let handled = SDKApplicationDelegate.shared.application(app, open: url, options: options)
        //let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: sourceApp, annotation: annotation)
        
        return handled
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

