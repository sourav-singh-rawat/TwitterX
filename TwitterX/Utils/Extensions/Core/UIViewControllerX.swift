//
//  UIViewControllerX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 21/01/23.
//

import UIKit

extension UIViewController {
    func addChildControllerSubview(_ childViewController: UIViewController){
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    func removeChildControllerSubview(){
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
