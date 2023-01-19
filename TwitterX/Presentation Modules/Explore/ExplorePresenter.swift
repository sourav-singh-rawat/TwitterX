//
//  ExplorePresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class ExplorePresenter: ViewToPresenterExploreProtocol {

    // MARK: Properties
    var view: PresenterToViewExploreProtocol?
    var interactor: PresenterToInteractorExploreProtocol?
    var router: PresenterToRouterExploreProtocol?
}

extension ExplorePresenter: InteractorToPresenterExploreProtocol {
    
}
