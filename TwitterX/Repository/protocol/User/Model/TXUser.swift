//
//  TXUser.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import UIKit

class TXUser: Decodable {
    let uid: String
    var profileImage: UIImage?
    let profileImageUrl: String
    let email: String
    var password: String?
    let fullname: String
    let username: String
    
    init(uid: String, profileImage: UIImage? = nil, profileImageUrl: String, email: String, password: String? = nil, fullname: String, username: String) {
        self.uid = uid
        self.profileImage = profileImage
        self.profileImageUrl = profileImageUrl
        self.email = email
        self.password = password
        self.fullname = fullname
        self.username = username
    }
    
    private enum CodingKeys: String, CodingKey {
        case uid
        case profileImageUrl
        case email
        case fullname
        case username
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try values.decode(String.self, forKey: .uid)
        profileImageUrl = try values.decode(String.self, forKey: .profileImageUrl)
        email = try values.decode(String.self, forKey: .email)
        fullname = try values.decode(String.self, forKey: .fullname)
        username = try values.decode(String.self, forKey: .username)
    }
}
