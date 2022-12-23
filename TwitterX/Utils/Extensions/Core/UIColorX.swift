//
//  UIColorX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIColor {
    static func rgb(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIColor {
    //TODO: Get from theme
    static let twitterBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
}
