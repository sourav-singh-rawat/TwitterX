//
//  UploadTweetProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUploadTweetProtocol {
    func tweetUploaded()
    func showTweetUploadError(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUploadTweetProtocol {
    
    var view: PresenterToViewUploadTweetProtocol? { get set }
    var interactor: PresenterToInteractorUploadTweetProtocol? { get set }
    var router: PresenterToRouterUploadTweetProtocol? { get set }
    
    func uploadTweet(tweet: String?)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUploadTweetProtocol {
    
    var presenter: InteractorToPresenterUploadTweetProtocol? { get set }
    
    func uploadTweet(tweet: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUploadTweetProtocol {
    func tweetUploadSuccess()
    func tweetUploadFailure(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUploadTweetProtocol {
    var navigationController: TXNavigationController? { get set }
}
