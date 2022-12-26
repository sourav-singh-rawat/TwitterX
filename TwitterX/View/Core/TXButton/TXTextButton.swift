//
//  TXTextButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXTextButton: TXButton {
    
    init(_ target: Any,
        title: String,
        onPressed: Selector
    ){
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        //TODO: theme
        setTitleColor(.white, for: .normal)
        addTarget(target, action: onPressed, for: .touchUpInside)
    }
    
    init(_ target: Any,
        attributedTitle title: NSAttributedString,
        onPressed: Selector
    ){
        super.init(frame: .zero)
        
        setAttributedTitle(title, for: .normal)
        addTarget(target, action: onPressed, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
