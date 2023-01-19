//
//  BottomTabProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewBottomTabProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBottomTabProtocol {
    
    var view: PresenterToViewBottomTabProtocol? { get set }
    var interactor: PresenterToInteractorBottomTabProtocol? { get set }
    var router: PresenterToRouterBottomTabProtocol? { get set }
    
    func createNewTweet()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBottomTabProtocol {
    
    var presenter: InteractorToPresenterBottomTabProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBottomTabProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBottomTabProtocol {
    var viewController: BottomTabViewController? { get set }
    
    func pushToCreateNewTweet()
}
