//
//  TweetListTile.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 12/01/23.
//

import UIKit

class TweetListTile: TXStackView {
    
    var user: TXUser
    var tweet: String
    var timestamp: Date
    
    private lazy var profileImageView: TXImageView = {
        let imgView = TXImageView(
            imageUrl: user.profileImageUrl,
            width: 48,
            height: 48
        )
        imgView.layer.cornerRadius = 48/2
        imgView.layer.masksToBounds = true
        imgView.backgroundColor = TXTheme.shared.color.primary
        
        return imgView
    }()
    
    
    private lazy var nameAndTweetStackView = NameAndTweetStack(
        user: user,
        tweet: tweet,
        timestamp: timestamp
    )
    
    
    init(user: TXUser, tweet: String, timestamp: Date){
        self.user = user
        self.tweet = tweet
        self.timestamp = timestamp
        
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addArrangedSubview(profileImageView)
        addArrangedSubview(nameAndTweetStackView)
        
        axis = .horizontal
    }
}

fileprivate class NameAndTweetStack: TXStackView {
    
    var user: TXUser
    var tweet: String
    var timestamp: Date
    
    private lazy var intoInfoLabel: TXLabel = {
        let infoText = NSMutableAttributedString(
            string: user.fullname,
            attributes: [.font : UIFont.boldSystemFont(ofSize: 14)]
        )
        
        //Support for old data
        infoText.append(NSAttributedString(
            string: " @\(user.username.lowercased())",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: TXTheme.shared.color.onBackgroundVarient
            ]
        ))
        
        let now = Date()
        if let time = timestamp.toTimeDifference(to: now) {
            infoText.append(NSAttributedString(
                string: " • \(time)",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: TXTheme.shared.color.onBackgroundVarient
                ]
            ))
        }
        
        let label = TXLabel()
        label.attributedText = infoText
        
        return label
    }()
    
    private lazy var tweetLabel: TXLabel = {
        let label = TXLabel()
        label.numberOfLines = 0
        label.text = tweet
        return label
    }()
    
    init(user: TXUser, tweet: String, timestamp: Date){
        self.user = user
        self.tweet = tweet
        self.timestamp = timestamp
        
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addArrangedSubview(intoInfoLabel)
        addArrangedSubview(tweetLabel)
        
        axis = .vertical
        spacing = 4
    }
}
