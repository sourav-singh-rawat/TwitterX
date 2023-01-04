//
//  FeedController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class FeedController: TXViewController {
    
    //MARK: - Properties
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helper
    
    private func configureUI() {
        view.backgroundColor = TXTheme.shared.color.background
        
        let imageView = TXImageView(image: UIImage(named: "twitter_logo_blue"))
        
        navigationItem.titleView = imageView
    }
    
}
