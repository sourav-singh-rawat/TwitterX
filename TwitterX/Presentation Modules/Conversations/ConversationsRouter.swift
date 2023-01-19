//
//  ConversationsRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class ConversationsRouter: PresenterToRouterConversationsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ConversationsViewController()
        
        let presenter: ViewToPresenterConversationsProtocol & InteractorToPresenterConversationsProtocol = ConversationsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ConversationsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ConversationsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
