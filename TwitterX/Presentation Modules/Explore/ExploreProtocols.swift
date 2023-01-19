//
//  ExploreProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewExploreProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterExploreProtocol {
    
    var view: PresenterToViewExploreProtocol? { get set }
    var interactor: PresenterToInteractorExploreProtocol? { get set }
    var router: PresenterToRouterExploreProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorExploreProtocol {
    
    var presenter: InteractorToPresenterExploreProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterExploreProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterExploreProtocol {
    
}
