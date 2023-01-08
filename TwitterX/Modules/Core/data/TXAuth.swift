//
//  TXAuth.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import Foundation

class TXAuth: TXAuthProtocol {
    static let shared = TXAuth()
    
    private init(){}
    
    private let userRepository = TXUserRepository()
    
    private var _isAuthenticated = false
    
    var isAuthenticated: Bool {
        get {
            return _isAuthenticated
        }
    }
    
    func onLogin(uuid: String) {
        userRepository.getUserDetails(
            with: TXGetUserDetailsRequest(uuid: uuid)
        ) {
            result in
                
//            switch result {
//            case .success(let response):
//                self?._currentUser = response.user
//                self?._isAuthenticated = true
//                break
//            case .failure(let response):
//
//                self?._isAuthenticated = false
//                break
//            }
        }
    }
    
    func onLogout() {
        <#code#>
    }
    
    private var _currentUser: TXUser? = nil
    
    var currentUser: TXUser? {
        get {
            return _currentUser
        }
    }
    
    func refreshUser() {
        if let _currentUser = _currentUser {
            
            let uuid = _currentUser.uid
            
            onLogin(uuid: uuid)
        }
    }
}