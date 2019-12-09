//
//  MenuOption.swift
//  SideMenu
//
//  Created by Julio Collado on 12/9/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible, CaseIterable {
    
    case Profile, Inbox, Notifications, Settings
    
    var description: String {
        switch self {
            
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notifications:
            return "Notifications"
        case .Settings:
             return "Settings"
        }
    }
    
    var image: UIImage {
           switch self {
           case .Profile:
                return #imageLiteral(resourceName: "person")
           case .Inbox:
                return #imageLiteral(resourceName: "email")
           case .Notifications:
                return #imageLiteral(resourceName: "menu")
           case .Settings:
                return #imageLiteral(resourceName: "settings")
           }
    }

}
