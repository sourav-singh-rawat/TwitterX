//
//  TXTweetRequest.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation

struct TXUploadTweetRequest: TXRepositoryRequest {
    let tweet: String
    
    func toPayload() -> [String : Any] {
        return [
            "uuid": TXAuth.shared.currentUser!.uid,
            "tweet": tweet,
            "likes": 0,
            "retweets": 0,
            "timestamp": Int(NSDate().timeIntervalSince1970)
        ]
    }
}
