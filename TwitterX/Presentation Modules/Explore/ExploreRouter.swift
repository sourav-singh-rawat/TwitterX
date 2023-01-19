//
//  ExploreRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class ExploreRouter: PresenterToRouterExploreProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ExploreViewController()
        
        let presenter: ViewToPresenterExploreProtocol & InteractorToPresenterExploreProtocol = ExplorePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ExploreRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ExploreInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
