//
//  UploadTweetRouter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation
import UIKit

class UploadTweetRouter: PresenterToRouterUploadTweetProtocol {
    
    var navigationController: TXNavigationController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = UploadTweetViewController()
        
        let presenter: ViewToPresenterUploadTweetProtocol & InteractorToPresenterUploadTweetProtocol = UploadTweetPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UploadTweetRouter()
        viewController.presenter?.router?.navigationController = viewController.navigationController as? TXNavigationController
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UploadTweetInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
