//
//  TweetTextField.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import Foundation

class TweetTextFieldView: TXStackView {
    private let profileImageView: TXImageView = {
        let imgView = TXImageView()
        imgView.setImage(
            imageUrl: TXAuth.shared.currentUser!.profileImageUrl,
            width: 48,
            height: 48
        )
        imgView.toRoundedImage()
        
        return imgView
    }()
    
    let textView: TXTextView = {
        let textView = TXTextView()
        textView.placeholderText = "What's happening?"
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    private func configureUI() {
        addArrangedSubview(profileImageView)
        addArrangedSubview(textView)
        
        axis = .horizontal
        spacing = 16
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
