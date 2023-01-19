//
//  TweetActionList.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 13/01/23.
//

import UIKit

class TweetActionList: TXStackView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterFeedProtocol?
    
    var tweet: TXTweet? {
        didSet {
            configureUI()
        }
    }
    
    private lazy var commentBtn = TweetActionButton(
        imageAsset: TXImageAsset.comment) { [unowned self]
            action in
            self.presenter?.commentOnTweet()
        }
    
    private lazy var retweetBtn = TweetActionButton(
        imageAsset: TXImageAsset.retweet) { [unowned self]
            action in
            self.presenter?.retweetOnTweet()
        }
    
    private lazy var likeBtn = TweetActionButton(
        imageAsset: TXImageAsset.like) { [unowned self]
            action in
            self.presenter?.likeOnTweet()
        }
    
    private lazy var shareBtn = TweetActionButton(
        imageAsset: TXImageAsset.share) { [unowned self]
            action in
            self.presenter?.shareTweet()
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
        handler: @escaping UIActionHandler
    ){
        super.init(frame: .zero)
        
        setImage(UIImage(named:imageAsset)!,width: 20,height: 20)
        addAction(handler: handler)
        
        tintColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
