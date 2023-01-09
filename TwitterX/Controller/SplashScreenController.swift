//
//  SplashScreenController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 07/01/23.
//

import UIKit

import UIKit

class SplashScreenController: UIViewController {
    
    //MARK: - Properties
    
    let twitterLogo: TXImageView = {
       let imgView = TXImageView(
        image: UIImage(named: TXImageAsset.twitterLogo),
        width: 150,
        height: 150
       )
        
        return imgView
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .twitterBlue
        
        configureUI()
    }
    
    //MARK: - Helper
    
    private func configureUI(){
        view.addSubview(twitterLogo)
        
        twitterLogo.alignment(
            to: view,
            alignment: TXAlignment.center
        )
    }
    
}
