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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let newGameVC = NewGameVC()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = newGameVC
        return true
    }

    // MARK: Lifecycle

}

