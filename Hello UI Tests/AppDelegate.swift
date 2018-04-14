//
//  AppDelegate.swift
//  Hello UI Tests
//
//  Created by Tomasz Wójcik on 11/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let bootstrap = AppBootstrap()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("application init")
        return true
    }
}

