//
//  TXActionButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXActionButton: TXButton {
    
    required init(
        title: String,
        onPressed: @escaping OnPressedTXButton,
        height: CGFloat = 50
    ){
        super.init(onPressed: onPressed)
        
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //TODO: on color theme
        setTitleColor(.twitterBlue, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 5
        
        self.height(height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}
