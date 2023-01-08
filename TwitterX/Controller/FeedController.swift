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
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helper
    
    private func configureUI() {
        view.backgroundColor = TXTheme.shared.color.background
        
        navigationItem.titleView = logoImageView
    }
    
}
