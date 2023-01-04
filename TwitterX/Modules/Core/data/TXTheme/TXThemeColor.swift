//
//  TXThemeColor.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import UIKit

struct TXLightThemeColor: TXThemeColorProtocol {
    var primary: UIColor {
        get {
            .twitterBlue
        }
    }
    
    var onPrimary: UIColor {
        get {
            .white
        }
    }
    
    var background: UIColor {
        get {
            .white
        }
    }
    
    var onBackgroud: UIColor {
        get {
            .black
        }
    }
}

struct TXDarkThemeColor: TXThemeColorProtocol {
    var primary: UIColor {
        get {
            .twitterBlue
        }
    }
    
    var onPrimary: UIColor {
        get {
            .black
        }
    }
    
    var background: UIColor {
        get {
            .black
        }
    }
    
    var onBackgroud: UIColor {
        get {
            .white
        }
    }
}


