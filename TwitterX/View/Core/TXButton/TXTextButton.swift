//
//  TXTextButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXTextButton: TXButton {
    
    init(
        title: String,
        onPressed: @escaping OnPressedTXButton
    ){
        super.init(onPressed: onPressed)
        
        setTitle(title, for: .normal)
        setTitleColor(TXTheme.shared.color.primary, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    init(
        attributedTitle title: NSAttributedString,
        onPressed: @escaping OnPressedTXButton
    ){
        super.init(onPressed: onPressed)
        
        setAttributedTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}
