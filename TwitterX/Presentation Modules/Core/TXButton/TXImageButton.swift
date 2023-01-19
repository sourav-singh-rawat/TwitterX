//
//  TXImageButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 26/12/22.
//

import UIKit

class TXImageButton: TXButton {
    private var width: CGFloat?,height: CGFloat?
    
    func setImage(
        _ image: UIImage?,
        width: CGFloat = 50,
        height: CGFloat = 50,
        for state: UIControl.State = .normal
    ) {
        self.width = width
        self.height = height
        
        super.setImage(image, for: state)
        
        imageView?.contentMode = .scaleAspectFit
        clipsToBounds = true 
        tintColor = TXTheme.shared.color.onPrimary
        
        self.width(width)
        self.height(height)
    }
    
    func toRoundedImage() {
        if let _width = width, let _height = height, _width == _height {
            layer.cornerRadius = _width/2
            layer.masksToBounds = true
        }else {
            fatalError("Not a square image")
        }
    }
    
    func withBorder(
        borderColor color: UIColor = UIColor.white,
        borderWidth width: CGFloat = 3
    ){
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
