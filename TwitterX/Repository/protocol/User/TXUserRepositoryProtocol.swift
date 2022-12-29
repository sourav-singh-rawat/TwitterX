//
//  TXUserRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

//MARK: - Protocol

protocol TXUserRepositoryProtocol: TXRepositoryProtocol {
    func createUser(with request: TXCreateUserRequest)
}

//MARK: - Delegate

protocol TXUserRepositoryDelegate {
    func didCreateUserSuccess(response: TXCreateUserSuccess)
    func didCreateUserFailed(response: TXCreateUserFailure)
}

extension TXUserRepositoryDelegate {
    func didCreateUserSuccess(response: TXCreateUserSuccess) {
        
    }
    
    func didCreateUserFailed(response: TXCreateUserFailure) {
        
    }
}
