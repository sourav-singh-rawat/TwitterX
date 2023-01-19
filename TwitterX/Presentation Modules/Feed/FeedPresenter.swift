//
//  FeedPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class FeedPresenter: ViewToPresenterFeedProtocol {

    // MARK: Properties
    var view: PresenterToViewFeedProtocol?
    var interactor: PresenterToInteractorFeedProtocol?
    var router: PresenterToRouterFeedProtocol?
    
    func updateTweetsView() {
        interactor?.fetchTweets()
    }
    
    func getTweetsCount() -> Int? {
        return interactor?.tweets?.count
    }
    
    func getTweet(index: Int) -> TXTweet? {
        return interactor?.tweets?[index]
    }
    
    func commentOnTweet() {
        interactor?.commentOnTweet()
    }
    
    func retweetOnTweet() {
        interactor?.retweetOnTweet()
    }
    
    func likeOnTweet() {
        interactor?.likeOnTweet()
    }
    
    func shareTweet() {
        interactor?.shareTweet()
    }
}

extension FeedPresenter: InteractorToPresenterFeedProtocol {
    func tweetsFetched() {
        view?.showTweets()
    }
    
    func tweetsFetchedFailed(message: String) {
        view?.showTweetsFetchedError(message: message)
    }
}
