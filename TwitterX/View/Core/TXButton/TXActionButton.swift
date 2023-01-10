//
//  TXActionButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

typealias OnPressedTXActionButton = (_ sender: TXActionButton) -> Void

class TXActionButton: TXButton {
    
    let activityIndicator = TXActivityIndicatorView()
    private let title: String?
    
    private let onPressedActionCallback: OnPressedTXActionButton
    
    required init(
        title: String,
        onPressed: @escaping OnPressedTXActionButton,
        height: CGFloat = 50
    ){
        
        self.title = title
        
        self.onPressedActionCallback = onPressed
        
        func defaultOnPress() {}
        super.init(onPressed: defaultOnPress)
        
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitleColor(TXTheme.shared.color.primary, for: .normal)
        backgroundColor = TXTheme.shared.color.onPrimary
        layer.cornerRadius = 5
        
        addTarget(self, action: #selector(onPressedAction), for: .touchUpInside)
        
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
    
    @objc private func onPressedAction() {
        onPressedActionCallback(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(onPressed: @escaping OnPressedTXButton) {
        fatalError("init(onPressed:) has not been implemented")
    }
}
