//
//  FeedController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class FeedController: TXTableViewController {
    
    //MARK: - Properties
    
    var feedView = FeedView(frame: .zero)
    
    var tweets = [TXTweet]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let tweetRepository = TXTweetRepository()
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        fetchTweets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helper
    
    private func configureUI() {
        configureNavBar()
        
        self.tableView = feedView
        
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
    }
    
    private func configureNavBar() {
        navigationItem.titleView = feedView.logoImageView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: feedView.profileImageView)
        
        navigationController?.navigationBar.addBottomSeprator()
    }
    
    private func fetchTweets() {
        tweetRepository.fetchTweets(
            with: TXFetchTweetsRequest()
        ) { [weak self]
            result in
            
            switch result {
            case .success(let response):
                let tweets = response.tweets
                
                self?.tweets = tweets
                
                break
            case .failure(let response):
                self?.view.showToast(message: response.localizedDescription)
                break
            }
        }
    }
}

extension FeedController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
}
