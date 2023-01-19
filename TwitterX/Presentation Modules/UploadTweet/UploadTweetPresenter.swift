//
//  UploadTweetPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class UploadTweetPresenter: ViewToPresenterUploadTweetProtocol {

    // MARK: Properties
    var view: PresenterToViewUploadTweetProtocol?
    var interactor: PresenterToInteractorUploadTweetProtocol?
    var router: PresenterToRouterUploadTweetProtocol?
    
    func uploadTweet(tweet: String?) {
        if let tweet = tweet, !tweet.isEmpty {
            interactor?.uploadTweet(tweet: tweet)
        } else {
            view?.showTweetUploadError(message: "Write what's happening?")
        }
    }
}

extension UploadTweetPresenter: InteractorToPresenterUploadTweetProtocol {
    func tweetUploadSuccess() {
        view?.tweetUploaded()
    }
    
    func tweetUploadFailure(message: String) {
        view?.showTweetUploadError(message: message)
    }
}
