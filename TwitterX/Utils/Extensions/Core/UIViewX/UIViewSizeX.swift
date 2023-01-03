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
    
    func maxWidth(_ maxWidth: CGFloat){
        enableAutoResizing()
        
        self.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
    }
    
    func maxHeight(_ maxHeight: CGFloat){
        enableAutoResizing()
        
        self.heightAnchor.constraint(lessThanOrEqualToConstant: maxHeight).isActive = true
    }
    
    func minWidth(_ minWidth: CGFloat){
        enableAutoResizing()
        
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: minWidth).isActive = true
    }
    
    func minHeight(_ minHeight: CGFloat){
        enableAutoResizing()
        
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight).isActive = true
    }
}
