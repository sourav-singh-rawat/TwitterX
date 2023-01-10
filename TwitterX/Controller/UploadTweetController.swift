//
//  UploadTweetController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import UIKit

class UploadTweetController: TXViewController {
    
    //MARK: - Properties
    
    private lazy var cancleButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(onCanclePressed)
        )
        btn.tintColor = TXTheme.shared.color.primary
        
        return btn
    }()
    
    private lazy var tweetActionButton: UIBarButtonItem = {
        let tweetBtn = TXActionButton(
            title: "Tweet",
            onPressed: onTweetPressed,
            height: 32
        )
        tweetBtn.width(64)
        tweetBtn.layer.cornerRadius = 32/2
        tweetBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tweetBtn.backgroundColor = TXTheme.shared.color.primary
        tweetBtn.setTitleColor(TXTheme.shared.color.onPrimary, for: .normal)
        tweetBtn.activityIndicator.color = TXTheme.shared.color.onPrimary
        
        
        let btn = UIBarButtonItem(customView: tweetBtn)
        
        return btn
    }()
    
    private let tweetTextFieldView = TweetTextField()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc private func onCanclePressed() {
        dismiss(animated: true)
    }
    
    private func onTweetPressed(_ sender: TXActionButton) {
        func handleEmptyTweet() {
            showToast(message: "Write what's happening?")
        }
        
        guard let newTweet = tweetTextFieldView.textView.text else {
            handleEmptyTweet()
            return
        }
        
        if newTweet.isEmpty {
            handleEmptyTweet()
            return
        }
        
        sender.isLoading = true
        
        let tweetRepository = TXTweetRepository()
        
        let request = TXUploadTweetRequest(tweet: newTweet)
        
        tweetRepository.uploadTweet(
            with: request
        ) { [weak self]
            result in
                
            switch result {
            case .success(_):
                self?.onCanclePressed()
            case .failure(let response):
                self?.showToast(message: response.localizedDescription)
            }
            
            sender.isLoading = false
        }
    }
    
    //MARK: - Helper
    
    private func configureUI(){
        view.backgroundColor = TXTheme.shared.color.background
        
        configureNavBar()
        
        configureMainView()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.barTintColor = TXTheme.shared.color.background
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.addBottomSeprator()
        
        navigationItem.leftBarButtonItem = cancleButton
        navigationItem.rightBarButtonItem = tweetActionButton
    }
    
    private func configureMainView() {
        view.addSubview(tweetTextFieldView)
        
        tweetTextFieldView.position(
            in: self.view,
            withInsets: TXEdgeInsets.only(
                left: 16,
                right: 16,
                top: 16
            ),
            withSafeAreaProtected: true
        )
    }
}
