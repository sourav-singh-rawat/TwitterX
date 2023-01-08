//
//  TXAuth.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import Foundation

class TXAuth: TXAuthProtocol {
    static let shared = TXAuth()
    
    private let userRepository = TXUserRepository()
    
    func bootUp() {
        userRepository.verifyLoginCreds(
            with: TXVerifyLoginCredsRequest()
        ) { [weak self]
            result in
            
            switch result {
            case .success(let response):
                self?.onLogin(uuid: response.uuid)
                break
            case .failure(_):
                break
            }
            
        }
    }
    
    func bootDown() {
        //
    }
    
    private init(){}
    
    private var _isAuthenticated = false
    
    var isAuthenticated: Bool {
        get {
            return _isAuthenticated
        }
    }
    
    func onLogin(uuid: String) {
        userRepository.getUserDetails(
            with: TXGetUserDetailsRequest(uuid: uuid)
        ) { [weak self]
            result in
                
            switch result {
            case .success(let response):
                self?._currentUser = response.user
                self?._isAuthenticated = true
                break
            case .failure(_):
                self?._currentUser = nil
                self?._isAuthenticated = false
                break
            }
            
            self?.notifyListeners()
        }
    }
    
    func onLogout() {
        _currentUser = nil
        _isAuthenticated = false
        
        notifyListeners()
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
    
    private func notifyListeners() {
        NotificationCenter.default.post(Notification(name: .authStatus))
    }
}
