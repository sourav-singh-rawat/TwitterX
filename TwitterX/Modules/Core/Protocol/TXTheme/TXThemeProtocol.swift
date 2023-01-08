//
//  TXThemeProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import Foundation

enum TXThemeType {
    case dark
    case light
}

protocol TXThemeProtocol: TXCoreModulesProtocol {
    var currentTheme: TXThemeType { get }
    func changeTheme(to themeType: TXThemeType)
    var color: TXThemeColorProtocol { get }
}
