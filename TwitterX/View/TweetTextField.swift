//
//  TweetTextField.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import Foundation

class TweetTextField: TXStackView {
    private let profileImageView: TXImageView = {
        let imgView = TXImageView(
            imageUrl: TXAuth.shared.currentUser!.profileImageUrl,
            width: 48,
            height: 48
        )
        imgView.layer.cornerRadius = 48/2
        imgView.layer.masksToBounds = true
        imgView.backgroundColor = TXTheme.shared.color.primary
        
        return imgView
    }()
    
    let textView: TXTextView = {
        let textView = TXTextView()
        textView.placeholderText = "What's happening?"
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addArrangedSubview(profileImageView)
        addArrangedSubview(textView)
        
        alignment = .leading
        axis = .horizontal
        spacing = 16
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
