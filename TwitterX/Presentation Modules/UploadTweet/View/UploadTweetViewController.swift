//
//  UploadTweetViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class UploadTweetViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TXTheme.shared.color.background
        
        configureNavBar()
     
        configureUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterUploadTweetProtocol?
    
    private lazy var cancleButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancleModal)
        )
        btn.tintColor = TXTheme.shared.color.primary
        
        return btn
    }()
    
    private lazy var tweetActionButton: UIBarButtonItem = {
        let tweetBtn = TXActionButton()
        tweetBtn.setTitle("Tweet",height: 32)
        tweetBtn.width(64)
        tweetBtn.layer.cornerRadius = 32/2
        tweetBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tweetBtn.backgroundColor = TXTheme.shared.color.primary
        tweetBtn.setTitleColor(TXTheme.shared.color.onPrimary, for: .normal)
        tweetBtn.activityIndicator.color = TXTheme.shared.color.onPrimary
        tweetBtn.addAction { [unowned self]
            action in
        
            tweetBtn.isLoading = true
            
            self.presenter?.uploadTweet(tweet: tweetTextFieldView.textView.text)
        }
        
        let btn = UIBarButtonItem(customView: tweetBtn)
        
        return btn
    }()
    
    private let tweetTextFieldView = TweetTextFieldView()
    
    private func configureNavBar() {
        navigationController?.navigationBar.barTintColor = TXTheme.shared.color.background
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.addBottomSeprator()
        
        navigationItem.leftBarButtonItem = cancleButton
        navigationItem.rightBarButtonItem = tweetActionButton
    }
    
    private func configureUI() {
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

extension UploadTweetViewController: PresenterToViewUploadTweetProtocol{
    func tweetUploaded() {
        stopTweetBtnLoading()
        
        cancleModal()
    }
    
    func showTweetUploadError(message: String) {
        view.showToast(message: message)
        
        stopTweetBtnLoading()
    }
    
    private func stopTweetBtnLoading() {
        let tweetBtn = tweetActionButton.customView as! TXActionButton
        tweetBtn.isLoading = false
    }
}

//MARK: - Helper
extension UploadTweetViewController {
    @objc private func cancleModal() {
        dismiss(animated: true)
    }
}
