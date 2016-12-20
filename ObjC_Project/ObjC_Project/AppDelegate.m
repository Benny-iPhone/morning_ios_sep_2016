//
//  AppDelegate.m
//  ObjC_Project
//
//  Created by Asher   Efrati  on 19/12/2016.
//  Copyright © 2016 Asher   Efrati . All rights reserved.
//

#import "AppDelegate.h"
#import "Item.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
/*
    Item *item0 = [Item new];
    Item *item1 = [[Item alloc] init];
    NSNumber *price1 = [[NSNumber alloc] initWithInteger:15];
    NSNumber *price2 = [NSNumber numberWithInteger:15];
    NSNumber *price3 = @15;
    Item *item2 = [[Item alloc] initWithTitle:@"title" price:price3 date:[NSDate new]];
    
    NSInteger primitiveInt = 3;
    
    NSArray *arr = [[NSArray alloc] initWithObjects:item0,item1,item2, nil];
    
    NSArray *arr1 = @[item0,item1,item2];
    
    
    [item2 doSomethingWithNum:@(primitiveInt) str:nil];
  */  
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
