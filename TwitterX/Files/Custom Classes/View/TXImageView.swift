//
//  TXImageView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXImageView: UIImageView {
    override init(image: UIImage? = nil) {
        super.init(image: image)
        
        contentMode = .scaleAspectFit
        //TODO: on theme
        tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
