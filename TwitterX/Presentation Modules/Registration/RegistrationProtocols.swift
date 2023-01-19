//
//  RegistrationProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewRegistrationProtocol {
    func profileImagePicked(image: UIImage)
    func registerUserSuccess()
    func showRegisterUserError(message: String)
}

extension PresenterToViewRegistrationProtocol {
    func profileImagePicked(image: UIImage) {}
    func registerUserSuccess() {}
    func showRegisterUserError(message: String) {}
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterRegistrationProtocol {
    
    var view: PresenterToViewRegistrationProtocol? { get set }
    var interactor: PresenterToInteractorRegistrationProtocol? { get set }
    var router: PresenterToRouterRegistrationProtocol? { get set }
    
    func pickProfileImage()
    func loginExistingUser()
    func registerUser(
        profileImage: UIImage?,
        email:String?,
        password: String?,
        fullname: String?,
        username: String?
    )
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorRegistrationProtocol {
    
    var presenter: InteractorToPresenterRegistrationProtocol? { get set }
    
    func registerUser(user: TXUser)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterRegistrationProtocol {
    func registerUserSuccess()
    func registerUserFailure(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterRegistrationProtocol {
    var viewController: RegistrationViewController? { get set }
    
    func popToLoginView()
}
