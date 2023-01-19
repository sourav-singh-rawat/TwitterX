//
//  SplashScreenRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class SplashScreenRouter: PresenterToRouterSplashScreenProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SplashScreenViewController()
        
        let presenter: ViewToPresenterSplashScreenProtocol & InteractorToPresenterSplashScreenProtocol = SplashScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SplashScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SplashScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
