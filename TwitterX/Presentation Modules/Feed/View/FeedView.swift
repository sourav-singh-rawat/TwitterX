//
//  FeedView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 12/01/23.
//

import UIKit

class FeedView: TXTableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configureUI()
    }
    
    // MARK: - Properties
    let activityIndicator = TXActivityIndicatorView()
    
    var logoImageView : TXImageView = {
        let imgView = TXImageView()
        imgView.setImage(
            image: UIImage(named:TXImageAsset.twitterLogoBlue)!,
            width: 44,
            height: 44
        )
        
        return imgView
    }()
    
    let profileImageView: TXImageView = {
        let imgView = TXImageView()
        imgView.setImage(
            imageUrl: TXAuth.shared.currentUser!.profileImageUrl,
            width: 32,
            height: 32
        )
        imgView.toRoundedImage()
        
        return imgView
    }()
    
    private func configureUI() {
        addSubview(activityIndicator)
        activityIndicator.alignment(
            to: self,
            alignment: TXAlignment.center,
            withSafeAreaPortected: true
        )
        
        activityIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
