//
//  FeedController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class FeedController: TXViewController {
    
    //MARK: - Properties
    
    let logoImageView = TXImageView(
        image: UIImage(named: "twitter_logo_blue"),
        width: 44,
        height: 44
    )
    
    let profileImageView: TXImageView = {
        let imgView = TXImageView(
            imageUrl: TXAuth.shared.currentUser!.profileImageUrl,
            width: 32,
            height: 32
        )
        imgView.layer.cornerRadius = 32/2
        imgView.backgroundColor = .twitterBlue
        imgView.layer.masksToBounds = true
        
        return imgView
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helper
    
    private func configureUI() {
        view.backgroundColor = TXTheme.shared.color.background
        
        configureNavBar()
        
        configureMainView()
    }
    
    private func configureNavBar() {
        navigationItem.titleView = logoImageView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    private func configureMainView() {
        
    }
}
