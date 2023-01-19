//
//  RegistrationRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class RegistrationRouter: PresenterToRouterRegistrationProtocol {
    
    var viewController: RegistrationViewController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = RegistrationViewController()
        
        let presenter: ViewToPresenterRegistrationProtocol & InteractorToPresenterRegistrationProtocol = RegistrationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RegistrationRouter()
        viewController.presenter?.router?.viewController = viewController
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RegistrationInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func popToLoginView() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
