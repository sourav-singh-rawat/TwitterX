//
//  NotificationsPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class NotificationsPresenter: ViewToPresenterNotificationsProtocol {

    // MARK: Properties
    var view: PresenterToViewNotificationsProtocol?
    var interactor: PresenterToInteractorNotificationsProtocol?
    var router: PresenterToRouterNotificationsProtocol?
}

extension NotificationsPresenter: InteractorToPresenterNotificationsProtocol {
    
}
