//
//  BottomTabViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class BottomTabViewController: TXTabBarController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
        
        configureUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterBottomTabProtocol?
    
    lazy var floatingActionButton: TXImageButton = {
        let btn = TXImageButton()
        btn.setImage(
            UIImage(named: TXImageAsset.new_tweet),
            width: 56,
            height: 56
        )
        btn.backgroundColor = TXTheme.shared.color.primary
        btn.addAction { [unowned self]
            action in
            self.presenter?.createNewTweet()
        }
    
        btn.toRoundedImage()
        
        return btn
    }()
    
    
    private func configureTabs() {
        let feed = TXNavigationController(
            rootViewController: FeedRouter.createModule()
        )
        feed.navigationBar.barTintColor = .white
        feed.tabBarItem.image = UIImage(named: TXImageAsset.home_unselected)
        
        let explore = TXNavigationController(
            rootViewController: ExploreRouter.createModule()
        )
        explore.navigationBar.barTintColor = .white
        explore.tabBarItem.image = UIImage(named: TXImageAsset.search_unselected)
        
        let notifications = TXNavigationController(
            rootViewController:NotificationsRouter.createModule()
        )
        notifications.navigationBar.barTintColor = .white
        notifications.tabBarItem.image = UIImage(named: TXImageAsset.like_unselected)
        
        let conversations = TXNavigationController(
            rootViewController:ConversationsRouter.createModule()
        )
        conversations.navigationBar.barTintColor = .white
        conversations.tabBarItem.image = UIImage(named: TXImageAsset.ic_mail_outline_white)
        
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

extension BottomTabViewController: PresenterToViewBottomTabProtocol{
    // TODO: Implement View Output Methods
}
