//
//  TXUserRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

typealias CreateUserCompletion = (Result<TXCreateUserSuccess,TXCreateUserFailure>)->Void
typealias AddUserDetailsCompletion = (Result<TXAddUserDetailsSuccess,TXAddUserDetailsFailure>)->Void
typealias VerifyLoginCredsCompletion = (Result<TXVerifyLoginCredsSuccess,TXVerifyLoginCredsFailure>)->Void
typealias LoginUserCompletion = (Result<TXLoginUserSuccess,TXLoginUserFailure>)->Void
typealias GetUserDetailsCompletion = (Result<TXGetUserDetailsSuccess,TXGetUserDetailsFailure>)->Void
typealias LogoutUserCompletion = (Result<TXLogoutUserSuccess,TXLogoutUserFailure>)->Void

protocol TXUserRepositoryProtocol: TXRepositoryProtocol {
    func createUser(
        with request: TXCreateUserRequest,
        completion: @escaping CreateUserCompletion
    )
    func addUserDetails(
        with request: TXAddUserDetailsRequest,
        completion: @escaping AddUserDetailsCompletion
    )
    
    func verifyLoginCreds(
        with request: TXVerifyLoginCredsRequest,
        completion: @escaping VerifyLoginCredsCompletion
    )
    
    func loginUser(
        with request: TXLoginUserRequest,
        completion: @escaping LoginUserCompletion
    )
    func getUserDetails(
        with request: TXGetUserDetailsRequest,
        completion: @escaping GetUserDetailsCompletion
    )
    func logoutUser(
        with request: TXLogoutUserRequest,
        completion: @escaping LogoutUserCompletion
    )
}
