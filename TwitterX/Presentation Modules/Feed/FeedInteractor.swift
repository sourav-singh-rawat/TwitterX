//
//  FeedInteractor.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class FeedInteractor: PresenterToInteractorFeedProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterFeedProtocol?
    
    private let tweetRepository = TXTweetRepository()
    
    var tweets: [TXTweet]?
    
    func fetchTweets() {
        tweetRepository.fetchTweets(
            with: TXFetchTweetsRequest()
        ) { [unowned self]
            result in
            
            switch result {
            case .success(let response):
                let tweets = response.tweets
                
                self.tweets = tweets
                
                self.presenter?.tweetsFetched()
                
                break
            case .failure(let response):
                
                self.presenter?.tweetsFetchedFailed(message: response.localizedDescription)
                
                break
            }
        }
    }
    
    func commentOnTweet() {
        print("Comment")
    }
    
    func retweetOnTweet() {
        print("retweet")
    }
    
    func likeOnTweet() {
        print("like")
    }
    
    func shareTweet() {
        print("share")
    }
    
}
