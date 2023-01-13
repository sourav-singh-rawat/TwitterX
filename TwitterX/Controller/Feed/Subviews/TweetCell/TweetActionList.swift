//
//  TweetActionList.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 13/01/23.
//

import UIKit

class TweetActionList: TXStackView {
    
    var onCommentPressed: OnPressedTXButton
    var onRetweetPressed: OnPressedTXButton
    var onLikePressed: OnPressedTXButton
    var onSharePressed: OnPressedTXButton
    
    private lazy var commentBtn = TweetActionButton(
        imageAsset: TXImageAsset.comment,
        onPressed: onCommentPressed
    )
    
    private lazy var retweetBtn = TweetActionButton(
        imageAsset: TXImageAsset.retweet,
        onPressed: onRetweetPressed
    )
    
    private lazy var likeBtn = TweetActionButton(
        imageAsset: TXImageAsset.like,
        onPressed: onLikePressed
    )
    
    private lazy var shareBtn = TweetActionButton(
        imageAsset: TXImageAsset.share,
        onPressed: onSharePressed
    )
    
    init(
        onCommentPressed: @escaping OnPressedTXButton,
        onRetweetPressed: @escaping OnPressedTXButton,
        onLikePressed: @escaping OnPressedTXButton,
        onSharePressed: @escaping OnPressedTXButton
    ){
        self.onCommentPressed = onCommentPressed
        self.onRetweetPressed = onRetweetPressed
        self.onLikePressed = onLikePressed
        self.onSharePressed = onSharePressed
        
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addArrangedSubview(TXView())
        addArrangedSubview(commentBtn)
        addArrangedSubview(TXView())
        addArrangedSubview(retweetBtn)
        addArrangedSubview(TXView())
        addArrangedSubview(likeBtn)
        addArrangedSubview(TXView())
        addArrangedSubview(shareBtn)
        addArrangedSubview(TXView())
        
        axis = .horizontal
        distribution = .equalSpacing
    }
}

fileprivate class TweetActionButton: TXImageButton {
    init(
        imageAsset: String,
        onPressed: @escaping OnPressedTXButton
    ){
        super.init(
            image: UIImage(named: imageAsset)!,
            onPressed: onPressed,
            width: 20,
            height: 20
        )
        
        tintColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}
