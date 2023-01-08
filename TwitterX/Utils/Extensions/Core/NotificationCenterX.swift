//
//  NotificationCenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import Foundation

extension Notification.Name {
    static var authStatus: Notification.Name {
        return .init("AuthStatus")
    }
    static var themeChange: Notification.Name {
        return .init("ThemeChange")
    }
}
