//
//  RegistrationInteractor.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class RegistrationInteractor: PresenterToInteractorRegistrationProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterRegistrationProtocol?
    
    private let userRepository = TXUserRepository()
    
    func registerUser(user: TXUser) {
        let request = TXCreateUserRequest(
            user: user
        )
        
        userRepository.createUser(with: request) {[unowned self]
            result in
            switch result {
            case .success(_):
                self.presenter?.registerUserSuccess()
                
                break
            case .failure(let response):
                self.presenter?.registerUserFailure(error: response.localizedDescription)
                
                break
            }
        }
    }
}
