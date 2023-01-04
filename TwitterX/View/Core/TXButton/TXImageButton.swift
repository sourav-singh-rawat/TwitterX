//
//  TXImageButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 26/12/22.
//

import UIKit

class TXImageButton: TXButton {
    private var widthSize: CGFloat
    private var heightSize: CGFloat
    
    init(
        image: UIImage,
        onPressed: @escaping OnPressedTXButton,
        width: CGFloat = 50,
        height: CGFloat = 50
    ){
        self.widthSize = width
        self.heightSize = height
        super.init(onPressed: onPressed)
        
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        clipsToBounds = true
        tintColor = TXTheme.shared.color.onPrimary
        
        self.width(width)
        self.height(height)
    }
    
    func toRoundedImage() {
        if(widthSize == heightSize){
            layer.cornerRadius = widthSize/2
            layer.masksToBounds = true
        } else {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}
