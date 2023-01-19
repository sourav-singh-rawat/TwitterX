//
//  UploadTweetInteractor.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class UploadTweetInteractor: PresenterToInteractorUploadTweetProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterUploadTweetProtocol?
    
    private let tweetRepository = TXTweetRepository()
    
    func uploadTweet(tweet: String) {
        let request = TXUploadTweetRequest(tweet: tweet)
        
        tweetRepository.uploadTweet(
            with: request
        ) { [unowned self]
            result in
                
            switch result {
            case .success(_):
                self.presenter?.tweetUploadSuccess()
            case .failure(let response):
                self.presenter?.tweetUploadFailure(message: response.localizedDescription)
            }
        }
    }
}
