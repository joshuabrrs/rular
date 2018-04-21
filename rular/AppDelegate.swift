//
//  AppDelegate.swift
//  rular
//
//  Created by Joshua Barrios on 4/13/18.
//  Copyright © 2018 Joshua Barrios. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        //this is where auth could be
        let myDB = Database.database().reference()
        myDB.setValue("it works!")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        
 
        

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        
        
        

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    
        
        

    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        
     
        

    }


}

