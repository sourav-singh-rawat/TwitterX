//
//  NotificationController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class NotificationsController: TXViewController {
    
    //MARK: - Properties
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helper
    
    private func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Notifications"
    }
    
    
}
