//
//  LoginPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {

    // MARK: Properties
    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    func login(email: String?,password: String?) {
        if (email ?? "").isEmpty {
            view?.showLoginError(message:"Enter email")
            return
        }
        if (password ?? "").isEmpty  {
            view?.showLoginError(message:"Enter password")
            return
        }
        
        interactor?.login(email: email!, password: password!)
    }
    
    func signUpNewUser() {
        router?.pushToRegistrationView()
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func loginSuccess() {
        view?.loginSuccess()
    }
    
    func loginFailure(message: String) {
        view?.showLoginError(message: message)
    }
}
