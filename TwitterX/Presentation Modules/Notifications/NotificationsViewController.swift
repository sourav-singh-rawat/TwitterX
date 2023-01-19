//
//  NotificationsViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class NotificationsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterNotificationsProtocol?
    
}

extension NotificationsViewController: PresenterToViewNotificationsProtocol{
    // TODO: Implement View Output Methods
}
