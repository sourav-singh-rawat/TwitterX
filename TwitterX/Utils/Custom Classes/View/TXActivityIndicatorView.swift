//
//  TXActivityIndicatorView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import UIKit

class TXActivityIndicatorView: UIActivityIndicatorView {
    required init() {
        super.init(frame: .zero)

        //TODO: Theme
        color = .twitterBlue
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
