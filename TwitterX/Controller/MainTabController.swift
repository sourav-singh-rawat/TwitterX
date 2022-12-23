//
//  MainTabViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 22/12/22.
//

import UIKit

class MainTabController: UITabBarController {

    //MARK: - Properties
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
    }

    //MARK: - Helper
    
    private func configureTabs() {
        let feed = FeedController().wrapWithNavigationController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")
        
        let explore = ExploreController().wrapWithNavigationController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")
        
        let notifications = NotificationsController().wrapWithNavigationController()
        notifications.tabBarItem.image = UIImage(named: "like_unselected")
        
        let conversations = ConversationsController().wrapWithNavigationController()
        conversations.tabBarItem.image = UIImage(named: "ic_mail_outline_white_2x-1")
        
        viewControllers = [feed, explore, notifications, conversations]
    }
}
