//
//  TweetCell.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 11/01/23.
//

import UIKit

class TweetCell: TXTableViewCell {
    static let identifier = "TweetCell"
    
    var tweet: TXTweet? {
        didSet {
            configureUI()
        }
    }
    
    private lazy var tweetListTile = TweetListTile(
        user: tweet!.user,
        tweet: tweet!.tweet,
        timestamp: tweet!.timestamp
    )
    
    private lazy var tweetActionList = TweetActionList(
        onCommentPressed: onCommentPressed,
        onRetweetPressed: onRetweetPressed,
        onLikePressed: onLikePressed,
        onSharePressed: onSharePressed
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = TXTheme.shared.color.background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        let stackView = TXStackView(
            arrangedSubviews:[
                tweetListTile,
                tweetActionList
            ]
        )
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        
        addSubview(stackView)
        
        stackView.position(
            in: self,
            withInsets: TXEdgeInsets.all(12)
        )
    }
    
    //MARK: - Helper
    
    private func onCommentPressed() {
        print("Comment")
    }
    
    private func onRetweetPressed() {
        print("Retweet")
    }
    
    private func onLikePressed() {
        print("Like")
    }
    
    private func onSharePressed() {
        print("Share")
    }
}


