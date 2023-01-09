//
//  UploadTweetController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import UIKit

class UploadTweetController: UIViewController {
    
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
        
        
        let btn = UIBarButtonItem(customView: tweetBtn)
        
        return btn
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc private func onCanclePressed() {
        dismiss(animated: true)
    }
    
    private func onTweetPressed() {
        print("Tweeeeee")
    }
    
    //MARK: - Helper
    
    private func configureUI(){
        view.backgroundColor = TXTheme.shared.color.background
        
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.barTintColor = TXTheme.shared.color.background
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.addBottomSeprator()
        
        navigationItem.leftBarButtonItem = cancleButton
        navigationItem.rightBarButtonItem = tweetActionButton
    }
    
}
