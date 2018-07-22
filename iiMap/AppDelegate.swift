//
//  AppDelegate.swift
//  iiMap
//
//  Created by li on 2018/07/21.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit
import NMAKit

// To obtain the application credentials, please register at https://developer.here.com/develop/mobile-sdks
let AppID = "rVKO4oJw5SL5QVQQ4n6v"
let AppCode = "USQsIqb6hgYsbqxa5seYMw"
let MapLicenseKey = "b6Wier/roHmUteH9S0t7MbxXFlkz0NskT7jbyjayCH6n62Psk+/DU5LdIUYlJJCS8kFHr2wfdrnFoB0u1A1t010yBhlm3yj7vrAN6OXUfH1s5t+qiTYjo1ipXFKKpC/+ay8KsTc4bDbAt4c73I3Ab/xcswZOThO3CXrGnzcT6dMC57zAxi4sUtN7XonlycqhjaMpFprixLMAffnwsJtNnPh/pLvNPmHActrt4M3awVu7DuAJiHQQ3MkP8NdolzLy2ezk7IlwHL6OyTAeWSnfSFDc4emcNxtwoZ9teKtFgEPPJrNZfNZ6xBd2Q//Zx7C9+Bu//jaweb8KqiIVMefVfsWE/g6GMa+KBAwyMLOx6Bp84dSw9Xg1lZWyz0meksZH4pBBjtYCInmT12reY4+pi4JmyzC266tsADunWWOOeCKwjQnEYFDYxN50UiZaXiSg29TI/WvBONRnxjB5+G1tPq177lJgMOZp7e2SGWpfsWDhrT/XbnwQnLeijU8n4UXXpZNpOCqe9+LL/Qe94cdlBV1+YHvEIFAugbo+fOK4+zVOtUg8KgcKPq1LAw+stGjekMW79du/jlz8yplbFoxVJ4soUTaLM3MpPqJwHVLeDn4cx7c2rjVVxOddZmoj7TzWImOvHp7Zaa0Rl6b1BUWBh9sy4sJTrvfN63XUFN76WhI="

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NMAApplicationContext.setAppId(AppID, appCode: AppCode, licenseKey: MapLicenseKey)
        return true
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

