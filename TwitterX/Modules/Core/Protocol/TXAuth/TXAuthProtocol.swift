//
//  TXAuthProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 04/01/23.
//

import Foundation

protocol TXAuthProtocol: TXCoreModulesProtocol {
    var isAuthenticated: Bool { get }
    
    func onLogin(uuid: String)
    
    func onLogout()
    
    var currentUser: TXUser? { get }
    
    func refreshUser()
}
