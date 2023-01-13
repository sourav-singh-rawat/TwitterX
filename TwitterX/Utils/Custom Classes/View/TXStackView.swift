//
//  TXStackView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spacing = 8
        alignment = .leading
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
