//
//  AppDelegate.swift
//  task10
//
//  Created by Anna Ershova on 25.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: Lifecycle
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("will finish launching")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "FirstTime") == nil {
            defaults.set("No", forKey:"FirstTime")
            window!.rootViewController = NewGameVC()
        } else {
            let newVC = NewGameVC()
            newVC.isFirst = false
            window!.rootViewController = newVC
        }
        window?.makeKeyAndVisible()
        print("did finish launching")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("active")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("resign")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("foreground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminate")
    }
    
//    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
//        print("save")
//        return true
//    }
//    
//    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
//        print("restore")
//        return true
//    }
}

