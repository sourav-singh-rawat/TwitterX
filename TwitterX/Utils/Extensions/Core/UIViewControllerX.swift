//
//  UIViewControllerX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIViewController {
    
    func wrapWithNavigationController() -> UINavigationController {
        let navController = UINavigationController(rootViewController: self)
        navController.navigationBar.barTintColor = .white
        
        return navController
    }
}
