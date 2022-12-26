//
//  TXImageButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 26/12/22.
//

import UIKit

class TXImageButton: TXButton {
    
    init(
        image: UIImage,
        onPressed: @escaping OnPressedTXButton,
        width: CGFloat = 50,
        height: CGFloat = 50
    ){
        super.init(onPressed: onPressed)
        
        setImage(image, for: .normal)
        //TODO: on color theme
        tintColor = .white
        
        self.width(width)
        self.height(height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}

