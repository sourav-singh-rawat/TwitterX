//
//  NotificationsProtocols.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNotificationsProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNotificationsProtocol {
    
    var view: PresenterToViewNotificationsProtocol? { get set }
    var interactor: PresenterToInteractorNotificationsProtocol? { get set }
    var router: PresenterToRouterNotificationsProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNotificationsProtocol {
    
    var presenter: InteractorToPresenterNotificationsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNotificationsProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNotificationsProtocol {
    
}
