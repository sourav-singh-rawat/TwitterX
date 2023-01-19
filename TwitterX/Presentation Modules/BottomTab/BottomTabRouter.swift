//
//  BottomTabRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class BottomTabRouter: PresenterToRouterBottomTabProtocol {
    
    var viewController: BottomTabViewController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = BottomTabViewController()
        
        let presenter: ViewToPresenterBottomTabProtocol & InteractorToPresenterBottomTabProtocol = BottomTabPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = BottomTabRouter()
        viewController.presenter?.router?.viewController = viewController
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = BottomTabInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushToCreateNewTweet() {
        let uploadTweetModule = UploadTweetRouter.createModule()
        let nav = TXNavigationController(rootViewController: uploadTweetModule)
        
        viewController?.present(nav, animated: true)
    }
}
