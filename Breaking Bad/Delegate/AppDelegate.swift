//
//  AppDelegate.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/14/21.
//

import UIKit
import IQKeyboardManagerSwift
import SideMenu
import Toast
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        return true
    }


    

}

