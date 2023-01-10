//
//  TXLabel.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 03/01/23.
//

import UIKit

class TXLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.systemFont(ofSize: 16)
        textColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
