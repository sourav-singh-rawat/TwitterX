//
//  TXUserRequest.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import Foundation

struct TXCreateUserRequest: TXRepositoryRequest {
    let user: TXUser
    
    func toPayload() -> [String : Any] {
        return [
            "profileImageUrl":user.profileImageUrl,
            "email":user.email,
            "password":user.password,
            "fullname":user.fullname,
            "username":user.username
        ]
    }
}
