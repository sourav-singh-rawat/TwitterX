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
    let user: TXUser
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

struct TXLoginUserSuccess: TXUserSuccessProtocol {
    var message: String?
    var user: TXUser
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
