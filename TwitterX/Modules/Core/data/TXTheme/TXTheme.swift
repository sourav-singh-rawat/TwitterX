//
//  TXTheme.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import Foundation

class TXTheme: TXThemeProtocol {
    static let shared = TXTheme()
    
    private init(){}
    
    private var _currentTheme: TXThemeType = .light
    
    var currentTheme: TXThemeType {
        get {
            return _currentTheme
        }
    }
    
    func changeTheme(to themeType: TXThemeType) {
        _currentTheme = themeType
        
        NotificationCenter.default.post(Notification(name: .themeChange))
    }
    
    var color: TXThemeColorProtocol {
        get {
            switch _currentTheme {
            case .light:
                return TXLightThemeColor()
            case .dark:
                return TXDarkThemeColor()
            }
        }
    }
}
