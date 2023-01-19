//
//  LoginInteractor.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class LoginInteractor: PresenterToInteractorLoginProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterLoginProtocol?
    
    private let userRepository = TXUserRepository()
    
    func login(email: String,password: String) {
        userRepository.loginUser(
            with: TXLoginUserRequest(
                email: email,
                password: password
            )) { [unowned self] result in
                switch result {
                case .success(_):
                    self.presenter?.loginSuccess()
                    break
                case .failure(let response):
                    self.presenter?.loginFailure(message: response.localizedDescription)
                    break
                }
            }
    }
}
