
//
//  AppDelegate.swift
//  News App
//
//  Created by Vikas Nair on 12/29/17.
//  Copyright © 2017 Vikas Nair. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

let APP_COLOR = UIColor.init(red: 22 / 255.0, green: 24 / 255.0, blue: 49 / 255.0, alpha: 1.0)
let SECONDARY_COLOR = UIColor.init(red: 80 / 255.0, green: 135 / 255.0, blue: 244 / 255.0, alpha: 1.0)
let TERTIARY_COLOR = UIColor.lightGray

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Properties
    
    var window: UIWindow?
    var sessionStartTime = Date()
    
    // MARK: App Delegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        let keyboardManager = IQKeyboardManager.shared
        keyboardManager.enable = true
        keyboardManager.shouldResignOnTouchOutside = true
        keyboardManager.keyboardDistanceFromTextField = 50
        keyboardManager.overrideKeyboardAppearance = false
        keyboardManager.enableAutoToolbar = false
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        NotificationCenter.default.post(name: Notification.Name.init("logHours"), object: nil, userInfo: [
            "elapsed" : Date().timeIntervalSince(sessionStartTime)
            ])
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

        sessionStartTime = Date()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

