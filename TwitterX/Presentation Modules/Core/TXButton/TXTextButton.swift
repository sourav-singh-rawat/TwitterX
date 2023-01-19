//
//  TXTextButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXTextButton: TXButton {
    
    override func setTitle(_ title: String?, for state: UIControl.State = .normal) {
        super.setTitle(title, for: state)
        
        setTitleColor(TXTheme.shared.color.primary, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    override func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State = .normal) {
        super.setAttributedTitle(title, for: state)
    }
}
