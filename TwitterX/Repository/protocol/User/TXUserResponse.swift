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
    var statusCode: String?
    var message: String
}

struct TXUpdateUserDetailsSuccess: TXUserSuccessProtocol {
    var message: String?
    let user: TXUser
}


struct TXCUpdateUserDetailsFailure: TXUserFailureProtocol {
    var statusCode: String?
    var message: String
}
