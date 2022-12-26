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
            let button = TXActionButton(self,
                title: "Login",
                onPressed: #selector(onLoginPressed)
            )
            
            button.height(50)
            
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
    
    lazy var signupButton : TXTextButton = {
        let attributedTitle = NSMutableAttributedString(
            string: "Don't have an account? ",
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        )
        
        attributedTitle.append(
            NSMutableAttributedString(
                string: "Sign Up",
                attributes: [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor.white
                ]
            )
        )
        
       let btn = TXTextButton(self,
        attributedTitle: attributedTitle,
        onPressed: #selector(onSignUpPressed)
       )
        
        return btn
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
    
    @objc private func onLoginPressed() {
        print("login")
    }
    
    @objc private func onSignUpPressed() {
        print("sign up")
    }
    
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
        
        view.addSubview(signupButton)
        signupButton.alignment(
            to: view,
            alignment: TXAlignment.bottomCenter,
            withSafeAreaPortected: true
        )
        signupButton.margin(
            to: view,
            withInsets: TXEdgeInsets.only(
                bottom: 16
            ),
            withSafeAreaProtected: true
        )
    }
    
    
}
