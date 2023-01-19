//
//  RegistrationFormView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 19/01/23.
//

import UIKit

class RegistrationFormViewController: TXViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        configureUI()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterRegistrationProtocol?
    
    private lazy var addPhotoFieldView: TXImageButton = {
        let btn = TXImageButton()
        btn.setImage(UIImage(named: TXImageAsset.plus_photo)!,width: 128,height: 128)
        btn.addAction { [unowned self]
            action in
            
            self.presenter?.pickProfileImage()
        }
    
        return btn
    }()
    
    private let emailTextField: TXTextInputField = {
        let inputField = TXTextField(
            placeholder: "Email"
        )
        
        let field = TXTextInputField(
            withImage: UIImage(named: TXImageAsset.mail),
            withTextField: inputField
        )
        
        return field
    }()
    
    private let passwordTextField: TXTextInputField = {
        let inputField = TXTextField(
            placeholder: "Password"
        )
        inputField.isSecureTextEntry = true
        
        let field = TXTextInputField(
            withImage: UIImage(named: TXImageAsset.lock_outline),
            withTextField: inputField
        )
        
        return field
    }()
    
    private let fullnameTextField: TXTextInputField = {
        let inputField = TXTextField(
            placeholder: "Full Name"
        )
        
        let field = TXTextInputField(
            withImage: UIImage(named: TXImageAsset.person_outline),
            withTextField: inputField
        )
        
        return field
    }()
    
    private let usernameTextField: TXTextInputField = {
        let inputField = TXTextField(
            placeholder: "Username"
        )
        
        let field = TXTextInputField(
            withImage: UIImage(named: TXImageAsset.person_outline),
            withTextField: inputField
        )
        
        return field
    }()
    
    private lazy var signupButton: TXActionButton = {
       let btn = TXActionButton()
        btn.setTitle("Sign Up")
        btn.addAction { [unowned self]
            action in
            
            btn.isLoading = true
            
            self.presenter?.registerUser(
                profileImage: addPhotoFieldView.currentImage,
                email: emailTextField.textField.text,
                password: passwordTextField.textField.text,
                fullname: fullnameTextField.textField.text,
                username: usernameTextField.textField.text
            )
        }
        
        return btn
    }()
    
    private func configureUI() {
        view.addSubview(addPhotoFieldView)
        addPhotoFieldView.alignment(
            to: view,
            alignment: TXAlignment.topCenter,
            withSafeAreaPortected: true
        )
        
        let stackView = TXStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(fullnameTextField)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(signupButton)
        
        view.addSubview(stackView)
        stackView.position(
            in: view,
            withInsets: TXEdgeInsets.symmetric(horizontal: 32),
            withSafeAreaProtected: true
        )
        stackView.margin(
            to: addPhotoFieldView,
            withInsets: TXEdgeInsets.only(bottom: 0)
        )
    }
}

extension RegistrationFormViewController: PresenterToViewRegistrationProtocol {
    func profileImagePicked(image: UIImage) {
        addPhotoFieldView.setImage(image, for: .normal)
        addPhotoFieldView.toRoundedImage()
        addPhotoFieldView.withBorder()
    }
    
    func registerUserSuccess() {
        signupButton.isLoading = false
    }
    
    func showRegisterUserError(message: String) {
        signupButton.isLoading = false
    }
}
