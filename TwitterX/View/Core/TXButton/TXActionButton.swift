//
//  TXActionButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXActionButton: TXButton {
    
    private let activityIndicator = TXActivityIndicatorView()
    private let title: String?
    
    required init(
        title: String,
        onPressed: @escaping OnPressedTXButton,
        height: CGFloat = 50
    ){
        
        self.title = title
        
        super.init(onPressed: onPressed)
        
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //TODO: on color theme
        setTitleColor(.twitterBlue, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 5
        
        //TODO: on color theme
        activityIndicator.hidesWhenStopped = true
        
        self.height(height)
    }
    
    var isLoading: Bool {
        get {
            return self.isLoading
        }
        set {
            let _isLoading = newValue
            if _isLoading {
                showLoading()
            } else {
                hideLoading()
            }
        }
    }
    
    private func showLoading() {
        setTitle("", for: .normal)
        self.addSubview(activityIndicator)
        activityIndicator.alignment(
            to: self,
            alignment: TXAlignment.center
        )
        activityIndicator.startAnimating()
    }
    
    private func hideLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        
        setTitle(self.title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}
