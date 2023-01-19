//
//  FeedProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewFeedProtocol {
    func showTweets()
    func showTweetsFetchedError(message:String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFeedProtocol {
    
    var view: PresenterToViewFeedProtocol? { get set }
    var interactor: PresenterToInteractorFeedProtocol? { get set }
    var router: PresenterToRouterFeedProtocol? { get set }
    
    func updateTweetsView()
    func getTweetsCount() -> Int?
    func getTweet(index: Int) -> TXTweet?
    func commentOnTweet()
    func retweetOnTweet()
    func likeOnTweet()
    func shareTweet()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorFeedProtocol {
    
    var presenter: InteractorToPresenterFeedProtocol? { get set }
    
    var tweets: [TXTweet]? { get }
    
    func fetchTweets()
    func commentOnTweet()
    func retweetOnTweet()
    func likeOnTweet()
    func shareTweet()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterFeedProtocol {
    func tweetsFetched()
    func tweetsFetchedFailed(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFeedProtocol {
    
}
