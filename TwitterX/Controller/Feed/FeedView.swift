//
//  FeedView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 12/01/23.
//

import UIKit

class FeedView: TXTableView {
    
    let activityIndicator = TXActivityIndicatorView()
    
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
        imgView.backgroundColor = TXTheme.shared.color.primary
        imgView.layer.masksToBounds = true
        
        return imgView
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(activityIndicator)
        
        activityIndicator.alignment(
            to: self,
            alignment: TXAlignment.center,
            withSafeAreaPortected: true
        )
        
        activityIndicator.startAnimating()
    }
}
