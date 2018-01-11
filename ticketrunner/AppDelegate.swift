//
//  AppDelegate.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 26.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import Intercom

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    internal var shouldRotate = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let newController = HomeTableController(style: .plain)
        let navController = UINavigationController(rootViewController: newController)
        
        
        window?.rootViewController = navController
        
        UINavigationBar.appearance().barTintColor = UIColor.white //UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        UINavigationBar.appearance().tintColor = ColorCodes.textColorGrey //UIColor.white
        
        application.statusBarStyle = .default
        
        //Intercom integreation
        Intercom.setApiKey("ios_sdk-70a0437b41358af3a51f28f14bbc86ab984e74c1", forAppId:"yfbwo9xg")
        
        Intercom.registerUnidentifiedUser()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        UserDefaults.standard.set(false, forKey: WelcomeStatisticsCell.welcomeCellLoadedString)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        UserDefaults.standard.set(false, forKey: WelcomeStatisticsCell.welcomeCellLoadedString)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaults.standard.set(false, forKey: WelcomeStatisticsCell.welcomeCellLoadedString)
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        return shouldRotate ? .allButUpsideDown : .portrait
        
    }


}

