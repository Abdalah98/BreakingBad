//
//  ExtControllrt.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/16/21.
//

import Foundation
import UIKit
import SideMenu

extension SideMenuManager {
    func setSideMenuViewController() -> UIViewController {
        if UserDefaults.standard.string(forKey: "LANG") == "ar" {
            return menuRightNavigationController!
        } else {
            return menuLeftNavigationController!
        }
    }
}
