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
    //    setupSideMenu()
        return true
    }

//    func setupSideMenu() {
//
//        let menu = UISideMenuNavigationController(rootViewController:SideMenuVC.create() )
//        menu.isNavigationBarHidden = true
//        SideMenuManager.default.menuLeftNavigationController = menu
//
//        SideMenuManager.default.menuFadeStatusBar = false
//        SideMenuManager.default.menuAllowPushOfSameClassTwice = false
//        SideMenuManager.default.menuPresentMode = .menuSlideIn
//        SideMenuManager.default.menuPushStyle = .default
//        SideMenuManager.default.menuWidth = (window?.frame.width)! * 0.7
//        SideMenuManager.default.menuDismissOnPush = true
//        SideMenuManager.default.menuAnimationBackgroundColor = .black
//        SideMenuManager.default.menuAnimationFadeStrength = 0.5
//
//
//    }
    

}

