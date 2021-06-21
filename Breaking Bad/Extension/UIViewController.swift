//
//  UIViewController.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation

import UIKit

extension UIViewController {
    
    public static var identifier: String {
        return  NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
        
    }
}
