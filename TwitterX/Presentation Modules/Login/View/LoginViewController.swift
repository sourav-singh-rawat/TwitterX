//
//  LoginViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        configureUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterLoginProtocol?
    
    private let logoImageView: TXImageView = {
        let imgView = TXImageView()
        imgView.setImage(
            image: UIImage(named: TXImageAsset.twitterLogo)!,
            width: 150,
            height: 150
        )
        
        return imgView
    }()
    
    lazy var loginFormView: LoginFormView = {
        let view = LoginFormView()
        view.presenter = presenter
        
        return view
    }()
    
    lazy var signupButton : TXTextButton = {
        let attributedTitle = NSMutableAttributedString(
            string: "Don't have an account? ",
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: TXTheme.shared.color.onPrimary
            ]
        )
        
        attributedTitle.append(
            NSMutableAttributedString(
                string: "Sign Up",
                attributes: [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: TXTheme.shared.color.onPrimary
                ]
            )
        )
        
        let btn = TXTextButton()
        btn.setAttributedTitle(attributedTitle)
        btn.addAction { [unowned self]
            action in
            
            self.presenter?.signUpNewUser()
        }
        
        return btn
    }()
    
    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = true
        //nav bar content become white
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func configureUI() {
        view.backgroundColor = TXTheme.shared.color.primary
        
        view.addSubview(logoImageView)
        logoImageView.alignment(
            to: view,
            alignment: .topCenter,
            withSafeAreaPortected: true
        )
        
        view.addSubview(loginFormView)
        loginFormView.position(
            in: view,
            withInsets: TXEdgeInsets.symmetric(
                horizontal: 32
            ),
            withSafeAreaProtected: true
        )
        loginFormView.margin(
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
    }
    
    private func _showToast(message: String) {
        view.showToast(message: message,withBottomInset: 32)
    }
}

extension LoginViewController: PresenterToViewLoginProtocol{
    func loginSuccess() {
        loginFormView.loginButton.isLoading = false
    }
    
    func showLoginError(message: String) {
        _showToast(message: message)
        loginFormView.loginButton.isLoading = false
    }
}
