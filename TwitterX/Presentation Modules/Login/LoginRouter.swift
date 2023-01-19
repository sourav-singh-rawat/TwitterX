//
//  LoginRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterLoginProtocol {
    
    var viewController: LoginViewController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = LoginViewController()
        
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.router?.viewController = viewController
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LoginInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushToRegistrationView() {
        let registrationModule = RegistrationRouter.createModule()
        
        viewController?.navigationController?.pushViewController(registrationModule, animated: true)
    }
}
