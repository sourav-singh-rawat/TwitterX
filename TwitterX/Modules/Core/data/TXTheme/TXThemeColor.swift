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
    
    var onBackgroundVarient: UIColor {
        get {
            .lightGray
        }
    }
    
    var toast: UIColor {
        get {
            .black.withAlphaComponent(0.6)
        }
    }
    
    var onToast: UIColor {
        get {
            .white
        }
    }
    
    var navBarSeprater: UIColor {
        get {
            .gray.withAlphaComponent(0.4)
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
    
    var onBackgroundVarient: UIColor {
        get {
            .lightGray
        }
    }
    
    var toast: UIColor {
        get {
            .white.withAlphaComponent(0.6)
        }
    }
    
    var onToast: UIColor {
        get {
            .black
        }
    }
    
    var navBarSeprater: UIColor {
        get {
            .white.withAlphaComponent(0.4)
        }
    }
}


