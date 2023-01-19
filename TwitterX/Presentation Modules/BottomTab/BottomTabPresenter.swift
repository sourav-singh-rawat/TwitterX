//
//  BottomTabPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class BottomTabPresenter: ViewToPresenterBottomTabProtocol {

    // MARK: Properties
    var view: PresenterToViewBottomTabProtocol?
    var interactor: PresenterToInteractorBottomTabProtocol?
    var router: PresenterToRouterBottomTabProtocol?
    
    private var mainViewController: BottomTabViewController {
        get {
            return view as! BottomTabViewController
        }
    }
    
    func createNewTweet() {
        router?.pushToCreateNewTweet()
    }
}

extension BottomTabPresenter: InteractorToPresenterBottomTabProtocol {
    
}
