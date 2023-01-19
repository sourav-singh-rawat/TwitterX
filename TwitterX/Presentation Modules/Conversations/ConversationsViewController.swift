//
//  ConversationsViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class ConversationsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterConversationsProtocol?
    
}

extension ConversationsViewController: PresenterToViewConversationsProtocol{
    // TODO: Implement View Output Methods
}
