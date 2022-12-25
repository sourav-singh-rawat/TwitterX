//
//  TXViewControllerX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension TXViewController {
    
    func wrapWithNavigationController() -> TXNavigationController {
        let navController = TXNavigationController(rootViewController: self)
        navController.navigationBar.barTintColor = .white
        
        return navController
    }
}
