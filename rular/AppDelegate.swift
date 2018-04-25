//
//  AppDelegate.swift
//  rular
//
//  Created by Joshua Barrios on 4/13/18.
//  Copyright © 2018 Joshua Barrios. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        Database.database().isPersistenceEnabled = true

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        


    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
       
        
        

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    
        
        

    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        
       Database.database().isPersistenceEnabled = true
        

    }


}

