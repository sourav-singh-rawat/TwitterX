//
//  ConversationsPresenter.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import Foundation

class ConversationsPresenter: ViewToPresenterConversationsProtocol {

    // MARK: Properties
    var view: PresenterToViewConversationsProtocol?
    var interactor: PresenterToInteractorConversationsProtocol?
    var router: PresenterToRouterConversationsProtocol?
}

extension ConversationsPresenter: InteractorToPresenterConversationsProtocol {
    
}
