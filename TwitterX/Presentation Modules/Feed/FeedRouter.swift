//
//  FeedRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class FeedRouter: PresenterToRouterFeedProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = FeedViewController()
        
        let presenter: ViewToPresenterFeedProtocol & InteractorToPresenterFeedProtocol = FeedPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FeedRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = FeedInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
