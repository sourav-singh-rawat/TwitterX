//
//  SplashScreenPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class SplashScreenPresenter: ViewToPresenterSplashScreenProtocol {

    // MARK: Properties
    var view: PresenterToViewSplashScreenProtocol?
    var interactor: PresenterToInteractorSplashScreenProtocol?
    var router: PresenterToRouterSplashScreenProtocol?
}

extension SplashScreenPresenter: InteractorToPresenterSplashScreenProtocol {
    
}
