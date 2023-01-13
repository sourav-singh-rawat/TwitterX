//
//  TXTweetResponse.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation

protocol TXTweetFailureProtocol: TXRepositoryFailureProtocol {
    
}

protocol TXTweetSuccessProtocol: TXRepositorySuccessProtocol {
    
}

struct TXUploadTweetFailure: TXTweetFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXUploadTweetSuccess: TXTweetSuccessProtocol {
    var message: String?
}

struct TXFetchTweetsFailure: TXTweetFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXFetchTweetsSuccess: TXTweetSuccessProtocol {
    var message: String?
    
    let tweets: [TXTweet]
}
