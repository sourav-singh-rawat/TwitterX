//
//  TXImageView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXImageView: UIImageView {
    required init(
        image: UIImage? = nil,
        width: CGFloat = 50,
        height: CGFloat = 50
    ) {
        super.init(image: image)
        
        self.image = image
        contentMode = .scaleAspectFit
        //TODO: on theme
        tintColor = .white
        
        self.height(height)
        self.width(width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
