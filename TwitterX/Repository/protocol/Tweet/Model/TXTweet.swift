//
//  TXTweet.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation

struct TXTweet: Codable {
    let tid: String
    let uuid: String
    let tweet: String
    let likes: Int
    let retweets: Int
    let timestamp: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tid = try container.decode(String.self, forKey: .tid)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.tweet = try container.decode(String.self, forKey: .tweet)
        self.likes = try container.decode(Int.self, forKey: .likes)
        self.retweets = try container.decode(Int.self, forKey: .retweets)
        
        let timestamp = try container.decode(Double.self, forKey: .timestamp)
        self.timestamp = Date(timeIntervalSince1970: timestamp)
    }
}
