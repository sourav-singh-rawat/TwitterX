//
//  TXCoreModule.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 08/01/23.
//

import Foundation

class TXCoreModules: TXCoreModulesProtocol {
    
    static let shared = TXCoreModules()
    
    private init() {}
    
    private let modules: [TXBooterProtocol] = [
        TXAuth.shared
    ]
    
    func bootUp() {
        for module in modules {
            module.bootUp()
        }
    }
    
    func bootDown() {
        for module in modules.reversed() {
            module.bootDown()
        }
    }
}
