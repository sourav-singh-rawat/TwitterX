//
//  FeedViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class FeedViewController: TXTableViewController {
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        
        presenter?.updateTweetsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        configureUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterFeedProtocol?
    
    var feedView = FeedView()
    
    private func configureNavBar() {
        navigationItem.titleView = feedView.logoImageView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: feedView.profileImageView)
        
        navigationController?.navigationBar.addBottomSeprator()
    }
    
    private func configureUI() {
        tableView = feedView
        
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
    }
    
}

extension FeedViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTweetsCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier) as! TweetCell
        
        cell.presenter = presenter
        
        cell.tweet = presenter?.getTweet(index: indexPath.row)
        
        return cell
    }
}

extension FeedViewController: PresenterToViewFeedProtocol{
    func showTweets() {
        tableView.reloadData()
        
        feedView.activityIndicator.stopAnimating()
    }
    
    func showTweetsFetchedError(message: String) {
        view.showToast(message: message)
        
        feedView.activityIndicator.stopAnimating()
    }
}
