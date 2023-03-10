//
//  TXActionButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit


class TXActionButton: TXButton {
    
    let activityIndicator = TXActivityIndicatorView()
    
    private var title: String?
    
    func setTitle(
        _ title: String?,
        for state: UIControl.State = .normal,
        height: CGFloat = 50
    ) {
        super.setTitle(title, for: state)
        
        self.title = title
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitleColor(TXTheme.shared.color.primary, for: .normal)
        backgroundColor = TXTheme.shared.color.onPrimary
        layer.cornerRadius = 5
        
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
}
