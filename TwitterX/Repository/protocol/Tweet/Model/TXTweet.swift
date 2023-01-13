//
//  TXTweet.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation

struct TXTweet: Codable {
    let tid: String
    let user: TXUser
    let tweet: String
    let likes: Int
    let retweets: Int
    let timestamp: Date
    
    private enum CodingKeys: String, CodingKey {
        case tid
        case user
        case tweet
        case likes
        case retweets
        case timestamp
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.tid, forKey: .tid)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.tweet, forKey: .tweet)
        try container.encode(self.likes, forKey: .likes)
        try container.encode(self.retweets, forKey: .retweets)
        try container.encode(Int(self.timestamp.timeIntervalSince1970), forKey: .timestamp)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tid = try container.decode(String.self, forKey: .tid)
        self.user = try container.decode(TXUser.self, forKey: .user)
        self.tweet = try container.decode(String.self, forKey: .tweet)
        self.likes = try container.decode(Int.self, forKey: .likes)
        self.retweets = try container.decode(Int.self, forKey: .retweets)
        
        let timestamp = try container.decode(Double.self, forKey: .timestamp)
        self.timestamp = Date(timeIntervalSince1970: timestamp)
    }
}
