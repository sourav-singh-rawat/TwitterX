//
//  LoginController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

class LoginController: TXViewController {
    
    //MARK: - Properties
    
    private var email: String?
    private var password: String?
    
    let userRepository = TXUserRepository()
    
    private let logoImageView: TXImageView = {
        let imgView = TXImageView(
            image: UIImage(named: ImageAsset.twitterLogo),
            width: 150,
            height: 150
        )
        imgView.clipsToBounds = true
        
        return imgView
    }()
    
    private lazy var loginContainerView: TXStackView = {
        lazy var emailContainerView: TXTextInputField = {
            let textField = TXTextField(
                withTag: TextField.emailField.rawValue,
                placeholder: "Email"
            )
            textField.controllerDelegate = self
            
            let view = TXTextInputField(
                withImage: UIImage(named: ImageAsset.mail),
                withTextField: textField
            )
            
            return view
        }()
        
        lazy var passwordContainerView: TXTextInputField = {
            let textField = TXTextField(
                withTag:TextField.passwordField.rawValue,
                placeholder: "Password"
            )
            textField.isSecureTextEntry = true
            textField.controllerDelegate = self
            
            let view = TXTextInputField(
                withImage: UIImage(named: ImageAsset.lock_outline),
                withTextField: textField
            )
            
            return view
        }()
        
        lazy var loginButton: TXActionButton = {
            let button = TXActionButton(
                title: "Login",
                onPressed: onLoginPressed
            )
            
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
        
       let btn = TXTextButton(
        attributedTitle: attributedTitle,
        onPressed: onSignUpPressed
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
        
        userRepository.delegate = self
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    private func verifyForm() -> Bool {
        if email == nil {
            _showToast(message:"Enter email")
            return false
        }
        if password == nil {
            _showToast(message:"Enter password")
            return false
        }
        
        return true
    }
    
    private func onLoginPressed() {
        let isFormVerified = verifyForm()
        
        if isFormVerified {
            userRepository.loginUser(
                with: TXLoginUserRequest(
                    email: email!,
                    password: password!
                )
            )
        }
    }
    
    private func onSignUpPressed() {
        let registrationController = RegistrationController()
        
        navigationController?.pushViewController(registrationController, animated: true)
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
    }
    
    private func _showToast(message: String) {
        showToast(message: message,withBottomInset: 32)
    }
}

extension LoginController: TXTextFieldDelegate {
    
    enum TextField: Int{
        case emailField = 0
        case passwordField = 1
    }
    
    func didTextFieldChange(_ textField: UITextField) {
        let newValue = textField.text
        
        switch textField.tag {
        case TextField.emailField.rawValue:
            onEmailChanged(newValue)
            break
        case TextField.passwordField.rawValue:
            onPasswordChanged(newValue)
            break
        default:
            break
        }
    }
    
    private func onEmailChanged(_ value:String?) {
        email = value
    }
    
    private func onPasswordChanged(_ value:String?) {
        password = value
    }
}

extension LoginController: TXUserRepositoryDelegate {
    func didLoginUserSuccess(response: TXLoginUserSuccess) {
        print(response.user.fullname)
    }
    
    func didLoginUserFailed(response: TXLoginUserFailure) {
        _showToast(message: response.message)
    }
}
