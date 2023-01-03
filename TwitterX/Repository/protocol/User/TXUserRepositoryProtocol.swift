//
//  TXUserRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

//MARK: - Protocol

protocol TXUserRepositoryProtocol: TXRepositoryProtocol {
    func createUser(with request: TXCreateUserRequest)
    func addUserDetails(with request: TXAddUserDetailsRequest)
}

//MARK: - Delegate

protocol TXUserRepositoryDelegate {
    func didCreateUserSuccess(response: TXCreateUserSuccess)
    func didCreateUserFailed(response: TXCreateUserFailure)
    
    func didAddUserDetailsSuccess(response: TXAddUserDetailsSuccess)
    func didAddUserDetailsFailed(response: TXAddUserDetailsFailure)
}

extension TXUserRepositoryDelegate {
    func didCreateUserSuccess(response: TXCreateUserSuccess) {
        
    }
    func didCreateUserFailed(response: TXCreateUserFailure) {
        
    }
    
    func didAddUserDetailsSuccess(response: TXAddUserDetailsSuccess){
        
    }
    func didAddUserDetailsFailed(response: TXAddUserDetailsFailure){
        
    }
}
