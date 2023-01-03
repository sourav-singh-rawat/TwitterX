//
//  TXRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import Foundation

//MARK: - Repository Protocol

protocol TXRepositoryProtocol {
    
}

//MARK: - Request Protocol

protocol TXRepositoryRequest{
    func toPayload() -> [String:Any]
}

//MARK: - Response Protocol

protocol TXRepositoryFailureProtocol: TXError {
    var statusCode: Int? { get set }
}

extension TXRepositoryFailureProtocol {
    var localizedDescription: String {
        get {
            return "😯 Oops! Something went wrong."
        }
    }
}

protocol TXRepositorySuccessProtocol {
    var message: String? { get set }
}

extension TXRepositorySuccessProtocol {
    var message: String? {
        get {
            return "Success"
        }
    }
}
