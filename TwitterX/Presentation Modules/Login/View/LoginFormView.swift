//
//  LoginFormView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 18/01/23.
//

import UIKit

class LoginFormView: TXStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties
    var presenter: ViewToPresenterLoginProtocol?
    
    private lazy var emailContainerView: TXTextInputField = {
        let textField = TXTextField(
            placeholder: "Email"
        )
        
        let view = TXTextInputField(
            withImage: UIImage(named: TXImageAsset.mail),
            withTextField: textField
        )
        
        return view
    }()
    
    private lazy var passwordContainerView: TXTextInputField = {
        let textField = TXTextField(
            placeholder: "Password"
        )
        textField.isSecureTextEntry = true
        
        let view = TXTextInputField(
            withImage: UIImage(named: TXImageAsset.lock_outline),
            withTextField: textField
        )
        
        return view
    }()
    
    lazy var loginButton: TXActionButton = {
        let button = TXActionButton()
        button.setTitle("Login")
        button.addAction { [unowned self]
            action in
            
            button.isLoading = true
            
            self.presenter?.login(
                email: emailContainerView.textField.text,
                password: passwordContainerView.textField.text
            )
        }
        
        return button
    }()
    
    
    private func configureUI() {
        axis = .vertical
        spacing = 20
        alignment = .fill
        
        addArrangedSubview(emailContainerView)
        addArrangedSubview(passwordContainerView)
        addArrangedSubview(loginButton)
    }
}
