//
//  ConversationsProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewConversationsProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterConversationsProtocol {
    
    var view: PresenterToViewConversationsProtocol? { get set }
    var interactor: PresenterToInteractorConversationsProtocol? { get set }
    var router: PresenterToRouterConversationsProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorConversationsProtocol {
    
    var presenter: InteractorToPresenterConversationsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterConversationsProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterConversationsProtocol {
    
}
