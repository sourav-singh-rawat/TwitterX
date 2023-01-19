//
//  SplashScreenViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TXTheme.shared.color.primary
        
        configureUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterSplashScreenProtocol?
    
    let twitterLogo: TXImageView = {
        let imgView = TXImageView()
        imgView.setImage(
            image:UIImage(named: TXImageAsset.twitterLogo)!,
            width: 150,
            height: 150
        )
        
        return imgView
    }()
    
    private func configureUI(){
        view.addSubview(twitterLogo)
        twitterLogo.alignment(
            to: view,
            alignment: TXAlignment.center
        )
    }
    
}

extension SplashScreenViewController: PresenterToViewSplashScreenProtocol{
    // TODO: Implement View Output Methods
}
