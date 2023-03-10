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
        return [:]
    }
}

struct TXAddUserDetailsRequest: TXRepositoryRequest {
    let user: TXUser
    
    func toPayload() -> [String : Any] {
        return [
            "uid":user.uid,
            "profileImageUrl":user.profileImageUrl,
            "email":user.email,
            "fullname":user.fullname,
            "username":user.username.lowercased()
        ]
    }
}

struct TXVerifyLoginCredsRequest: TXRepositoryRequest {
    func toPayload() -> [String : Any] {
        return [:]
    }
}

struct TXLoginUserRequest: TXRepositoryRequest {
    let email: String
    let password: String
    
    func toPayload() -> [String : Any] {
        return [:]
    }
}

struct TXGetUserDetailsRequest: TXRepositoryRequest {
    let uuid: String
    
    func toPayload() -> [String : Any] {
        return [:]
    }
}

struct TXLogoutUserRequest: TXRepositoryRequest {
    func toPayload() -> [String : Any] {
        return [:]
    }
}
