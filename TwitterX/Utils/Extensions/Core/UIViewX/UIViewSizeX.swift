//
//  UIViewSizeX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIView {
    func width(_ width: CGFloat){
        enableAutoResizing()
        
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func height(_ height: CGFloat){
        enableAutoResizing()
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
