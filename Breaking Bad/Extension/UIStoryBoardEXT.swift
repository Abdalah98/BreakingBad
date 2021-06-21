//
//  UIStoryBoardEXT.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation
import UIKit

public enum StoryBoardIdentifiers: String {
    case search                = "Search"
    case main                  = "Main"
    case death                 = "AllDeath"
    case characters            = "AllCharacters"
    case episode               = "AllEpisode"
    case searchEpisode         = "SearchEpisode"
    case searchDeath           = "SearchDeath"

    
}

extension UIStoryboard {
    static func instance<T: UIViewController>(_ name : StoryBoardIdentifiers = .main) -> T {
        let sto =  UIStoryboard.init(name: name.rawValue, bundle: nil)
        return sto.instantiateViewController(withIdentifier: T.identifier) as! T
    }
}

