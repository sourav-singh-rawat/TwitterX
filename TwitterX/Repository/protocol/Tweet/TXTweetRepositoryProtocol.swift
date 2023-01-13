//
//  TXTweetRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation

typealias UploadTweetCompletion = (Result<TXUploadTweetSuccess,TXUploadTweetFailure>) -> Void
typealias FetchTweetsCompletion = (Result<TXFetchTweetsSuccess,TXFetchTweetsFailure>) -> Void

protocol TXTweetRepositoryProtocol {
    func uploadTweet(
        with request: TXUploadTweetRequest,
        completion: @escaping UploadTweetCompletion
    )
    
    func fetchTweets(
        with request: TXFetchTweetsRequest,
        completion: @escaping FetchTweetsCompletion
    )
}
