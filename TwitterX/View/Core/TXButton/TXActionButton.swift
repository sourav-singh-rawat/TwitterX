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
        target: Any,
        onPressed: Selector,
        height: CGFloat = 50
    ){
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitleColor(.twitterBlue, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 5
        addTarget(target, action: onPressed, for: .touchUpInside)
        
        self.height(height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
