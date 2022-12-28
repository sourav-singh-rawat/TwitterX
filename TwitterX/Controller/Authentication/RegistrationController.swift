//
//  RegistrationController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 26/12/22.
//

import UIKit

class RegistrationController: UIViewController {
    
    //MARK: - Properties
    
    var media: TXMedia?
    
    lazy var addPhotoFieldView: TXImageButton = {
        let btn = TXImageButton(
            image: UIImage(named: "plus_photo")!,
            onPressed: onAddPhotoPressed,
            width: 128,
            height: 128
        )
    
        return btn
    }()
    
    lazy var signupContainerView: TXStackView = {
        let emailTextField: TXTextInputField = {
            let inputField = TXTextField(placeholder: "Email")
            
            let field = TXTextInputField(
                withImage: UIImage(named: "mail"),
                withTextField: inputField
            )
            
            return field
        }()
        
        let passwordTextField: TXTextInputField = {
            let inputField = TXTextField(placeholder: "Password")
            inputField.isSecureTextEntry = true
            
            let field = TXTextInputField(
                withImage: UIImage(named: "ic_lock_outline_white_2x"),
                withTextField: inputField
            )
            
            return field
        }()
        
        let fullnameTextField: TXTextInputField = {
            let inputField = TXTextField(placeholder: "Full Name")
            
            let field = TXTextInputField(
                withImage: UIImage(named: "ic_person_outline_white_2x"),
                withTextField: inputField
            )
            
            return field
        }()
        
        let usernameTextField: TXTextInputField = {
            let inputField = TXTextField(placeholder: "Username")
            
            let field = TXTextInputField(
                withImage: UIImage(named: "ic_person_outline_white_2x"),
                withTextField: inputField
            )
            
            return field
        }()
        
        let signupButton: TXActionButton = {
           let btn = TXActionButton(
            title: "Sign Up",
            onPressed: onSignupPressed
           )
            
            return btn
        }()
        
        let stackView = TXStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(fullnameTextField)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(signupButton)
        
        return stackView
    }()
    
    lazy var loginButton : TXTextButton = {
        let attributedTitle = NSMutableAttributedString(
            string: "Already have an account? ",
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        )
        
        attributedTitle.append(
            NSMutableAttributedString(
                string: "Log In",
                attributes: [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor.white
                ]
            )
        )
        
        let btn = TXTextButton(
            attributedTitle: attributedTitle,
            onPressed: onLoginPressed
        )
        
        return btn
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        media = TXMedia(navigationController: navigationController! as! TXNavigationController)
        media?.delegate = self
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    private func onLoginPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func onSignupPressed() {
        print("sign up")
    }
    
    private func onAddPhotoPressed() {
        
        media?.pickImage(isEditingAllowed: true)
        
    }
    
    //MARK: - Helper
    
    private func configureUI(){
        view.backgroundColor = .twitterBlue
        
        view.addSubview(addPhotoFieldView)
        addPhotoFieldView.alignment(
            to: view,
            alignment: TXAlignment.topCenter,
            withSafeAreaPortected: true
        )
        
        view.addSubview(signupContainerView)
        signupContainerView.position(
            in: view,
            withInsets: TXEdgeInsets.symmetric(horizontal: 32),
            withSafeAreaProtected: true
        )
        signupContainerView.margin(
            to: addPhotoFieldView,
            withInsets: TXEdgeInsets.only(bottom: 0)
        )
        
        view.addSubview(loginButton)
        loginButton.alignment(
            to: view,
            alignment: TXAlignment.bottomCenter,
            withSafeAreaPortected: true
        )
    }
    
}

//MARK: - TXMediaDelegate

extension RegistrationController: TXMediaDelegate {
    
    func didImagePicked(image: UIImage) {
        addPhotoFieldView.setImage(image, for: .normal)
        addPhotoFieldView.toRoundedImage()
        addPhotoFieldView.withBorder()
    }
    
}
