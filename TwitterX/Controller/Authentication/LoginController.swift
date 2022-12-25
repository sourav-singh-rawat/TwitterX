//
//  LoginController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class LoginController: TXViewController {
    
    //MARK: - Properties
    
    private let logoImageView: TXImageView = {
        let imgView = TXImageView()
        imgView.image = UIImage(named: "TwitterLogo")
        imgView.clipsToBounds = true
        
        imgView.width(150)
        imgView.height(150)
        
        return imgView
    }()
    
    private lazy var loginContainerView: TXStackView = {
        lazy var emailContainerView: TXTextInputField = {
            let textField = TXTextField(placeholder: "Email")
            
            let view = TXTextInputField(
                withImage: UIImage(named: "mail"),
                withTextField: textField
            )

            view.height(50)
            
            return view
        }()
        
        lazy var passwordContainerView: TXTextInputField = {
            let textField = TXTextField(placeholder: "Password")
            textField.isSecureTextEntry = true
            
            let view = TXTextInputField(
                withImage: UIImage(named: "ic_lock_outline_white_2x"),
                withTextField: textField
            )
            
            view.height(50)
            
            return view
        }()
        
        lazy var loginButton: TXActionButton = {
           let button = TXActionButton(title: "Login")
            
            return button
        }()
        
        let stackView = TXStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.addArrangedSubview(emailContainerView)
        stackView.addArrangedSubview(passwordContainerView)
        stackView.addArrangedSubview(loginButton)
        
        return stackView
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
        
        view.addSubview(loginContainerView)
        loginContainerView.position(
            in: view,
            withInsets: TXEdgeInsets.symmetric(
                horizontal: 32
            ),
            withSafeAreaProtected: true
        )
        loginContainerView.margin(
            to: logoImageView,
            withInsets: TXEdgeInsets.only(
                bottom: 0
            )
        )
    }
    
    
}
