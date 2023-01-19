//
//  LoginProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewLoginProtocol {
    func loginSuccess()
    func showLoginError(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLoginProtocol {
    
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
    
    func login(email: String?,password: String?)
    
    func signUpNewUser()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLoginProtocol {
    
    var presenter: InteractorToPresenterLoginProtocol? { get set }
    
    func login(email: String,password: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLoginProtocol {
    func loginSuccess()
    func loginFailure(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLoginProtocol {
    var viewController: LoginViewController? { get set }
    
    func pushToRegistrationView()
}
