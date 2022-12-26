//
//  MainTabViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 22/12/22.
//

import UIKit

class MainTabController: TXTabBarController {

    //MARK: - Properties
    
    lazy var floatingActionButton: TXButton = {
        let btn = TXButton(
            onPressed: onFloatingBtnPressed
        )
        btn.tintColor = .white
        btn.backgroundColor = .twitterBlue
        btn.setImage(UIImage(named: "new_tweet"), for: .normal)
    
        btn.width(56)
        btn.height(56)
        btn.layer.cornerRadius = 56/2
        
        return btn
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
        
        configureUI()
    }
    
    //MARK: - Selector
    
    private func onFloatingBtnPressed() {
        print("123")
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
    
    private func configureUI() {
        view.addSubview(floatingActionButton)
        
        floatingActionButton.position(
            in: view,
            withInsets: TXEdgeInsets.only(
                right: 16,
                bottom: 64
            ),
            withSafeAreaProtected: true
        )
    }
}
