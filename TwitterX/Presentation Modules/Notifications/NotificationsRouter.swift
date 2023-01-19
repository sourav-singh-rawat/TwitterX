//
//  NotificationsRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class NotificationsRouter: PresenterToRouterNotificationsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = NotificationsViewController()
        
        let presenter: ViewToPresenterNotificationsProtocol & InteractorToPresenterNotificationsProtocol = NotificationsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NotificationsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NotificationsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
