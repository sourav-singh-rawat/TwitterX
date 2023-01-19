//
//  RegistrationPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class RegistrationPresenter: ViewToPresenterRegistrationProtocol {

    // MARK: Properties
    var view: PresenterToViewRegistrationProtocol?
    var interactor: PresenterToInteractorRegistrationProtocol?
    var router: PresenterToRouterRegistrationProtocol?
    
    func pickProfileImage() {
        let viewController = view as? RegistrationViewController
        
        let media = TXMedia(navigationController: viewController?.navigationController as! TXNavigationController)
        media.delegate = self
        
        media.pickImage(isEditingAllowed: true)
    }
    
    func loginExistingUser() {
        router?.popToLoginView()
    }
    
    func registerUser(profileImage: UIImage?,email: String?, password: String?, fullname: String?, username: String?) {
        if profileImage == nil {
            view?.showRegisterUserError(message:"Select Profile image")
            return
        }
        if (email ?? "").isEmpty {
            view?.showRegisterUserError(message:"Enter email")
            return
        }
        if (password ?? "").isEmpty {
            view?.showRegisterUserError(message:"Enter password")
            return
        }
        if (fullname ?? "").isEmpty {
            view?.showRegisterUserError(message:"Enter fullname")
            return
        }
        if (username ?? "").isEmpty {
            view?.showRegisterUserError(message:"Enter username")
            return
        }
        
        let user = TXUser(
            uid: "",
            profileImage: profileImage!,
            profileImageUrl: "",
            email: email!,
            password: password!,
            fullname: fullname!,
            username: username!
        )
        
        interactor?.registerUser(user: user)
    }
}

extension RegistrationPresenter: InteractorToPresenterRegistrationProtocol {
    func registerUserSuccess() {
        view?.registerUserSuccess()
    }
    
    func registerUserFailure(message: String) {
        view?.showRegisterUserError(message: message)
    }
}

//MARK: - TXMediaDelegate

extension RegistrationPresenter: TXMediaDelegate {
    
    func didImagePicked(image: UIImage) {
        view?.profileImagePicked(image: image)
    }
    
}
