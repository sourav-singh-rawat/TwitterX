//
//  TXUserResponse.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import Foundation

protocol TXUserFailureProtocol: TXRepositoryFailureProtocol {
    
}

protocol TXUserSuccessProtocol: TXRepositorySuccessProtocol {
    
}

struct TXCreateUserSuccess: TXUserSuccessProtocol {
    var message: String?
}

struct TXCreateUserFailure: TXUserFailureProtocol {
    var statusCode: Int?
    var localizedDescription: String
}

struct TXAddUserDetailsSuccess: TXUserSuccessProtocol {
    var message: String?
    let user: TXUser
}

struct TXAddUserDetailsFailure: TXUserFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXVerifyLoginCredsSuccess: TXUserSuccessProtocol {
    var message: String?
    var uuid: String
}

struct TXVerifyLoginCredsFailure: TXUserFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXLoginUserSuccess: TXUserSuccessProtocol {
    var message: String?
}

struct TXLoginUserFailure: TXUserFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXGetUserDetailsSuccess: TXUserSuccessProtocol {
    var message: String?
    var user: TXUser
}

struct TXGetUserDetailsFailure: TXUserFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXLogoutUserSuccess: TXUserSuccessProtocol {
    var message: String?
}

struct TXLogoutUserFailure: TXUserFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}
