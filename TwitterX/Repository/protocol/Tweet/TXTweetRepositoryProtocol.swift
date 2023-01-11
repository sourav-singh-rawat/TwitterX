//
//  TXTweetRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation

typealias UploadTweetCompletion = (Result<TXUploadTweetSuccess,TXUploadTweetFailure>) -> Void
typealias GetAllTweetsCompletion = (Result<TXGetAllTweetsSuccess,TXGetAllTweetsFailure>) -> Void

protocol TXTweetRepositoryProtocol {
    func uploadTweet(
        with request: TXUploadTweetRequest,
        completion: @escaping UploadTweetCompletion
    )
    
    func getAllTweets(
        with request: TXGetAllTweetsRequest,
        completion: @escaping GetAllTweetsCompletion
    )
}
