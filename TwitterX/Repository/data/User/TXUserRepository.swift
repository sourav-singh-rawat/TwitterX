//
//  TXUserRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import Foundation
import FirebaseAuth

struct TXUserRepository: TXUserRepositoryProtocol {
    var delegate: TXUserRepositoryDelegate?
    
    func createUser(with request: TXCreateUserRequest) {
        
        func onCompletion(_ result: Any?, _ error: Error?) {
            if error != nil {
                delegate?.didCreateUserFailed(
                    response: TXCreateUserFailure.init(
                        message: error?.localizedDescription ?? "Failed to create user"
                    )
                )
                return
            }
        }
        
        Auth.auth().createUser(
            withEmail: request.user.email,
            password: request.user.password,
            completion: onCompletion
        )
    }
}
