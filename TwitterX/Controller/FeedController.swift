//
//  FeedController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class FeedController: TXViewController {
    
    //MARK: - Properties
    
    let tweetRepository = TXTweetRepository()
    
    let logoImageView = TXImageView(
        image: UIImage(named: TXImageAsset.twitterLogoBlue),
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
    
    override func loadView() {
        super.loadView()
        
        tweetRepository.getAllTweets(
            with: TXGetAllTweetsRequest()
        ) { [weak self]
            result in
            
            switch result {
            case .success(let response):
                let tweets = response.tweets
                
                for tweet in tweets {
                    print(tweet.tweet)
                }
                break
            case .failure(let response):
                self?.view.showToast(message: response.localizedDescription)
                break
            }
        }
    }
    
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
        navigationController?.navigationBar.addBottomSeprator()
        
        navigationItem.titleView = logoImageView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    private func configureMainView() {
        
    }
}
