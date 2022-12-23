//
//  LoginController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    let logoImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "TwitterLogo")
        imgView.clipsToBounds = true
        
        imgView.width(150)
        imgView.height(150)
        
        return imgView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .twitterBlue
        
        navigationController?.navigationBar.isHidden = true
        //nav bar content become white
        navigationController?.navigationBar.barStyle = .black
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    
    
    //MARK: - Helper
    
    private func configureUI() {
        view.addSubview(logoImageView)
        
        logoImageView.alignment(
            to: view,
            alignment: .topCenter,
            withSafeAreaPortected: true
        )
    }
    
    
}
