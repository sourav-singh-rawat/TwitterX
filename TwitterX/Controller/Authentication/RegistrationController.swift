//
//  RegistrationController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 26/12/22.
//

import UIKit
import Firebase

class RegistrationController: TXViewController {
    
    //MARK: - Properties
    
    private var profileImage: UIImage?
    private var email: String?
    private var password: String?
    private var fullname: String?
    private var username: String?
    
    private var media: TXMedia?
    
    private let userRepository = TXUserRepository()
    
    private let toastBottomMargin = 12
    
    private lazy var addPhotoFieldView: TXImageButton = {
        let btn = TXImageButton(
            image: UIImage(named: ImageAsset.plus_photo)!,
            onPressed: onAddPhotoPressed,
            width: 128,
            height: 128
        )
    
        return btn
    }()
    
    private lazy var signupContainerView: TXStackView = {
        let emailTextField: TXTextInputField = {
            let inputField = TXTextField(
                withTag: TextField.emailField.rawValue,
                placeholder: "Email"
            )
            inputField.controllerDelegate = self
            
            let field = TXTextInputField(
                withImage: UIImage(named: ImageAsset.mail),
                withTextField: inputField
            )
            
            return field
        }()
        
        let passwordTextField: TXTextInputField = {
            let inputField = TXTextField(
                withTag: TextField.passwordField.rawValue,
                placeholder: "Password"
            )
            inputField.isSecureTextEntry = true
            inputField.controllerDelegate = self
            
            let field = TXTextInputField(
                withImage: UIImage(named: ImageAsset.lock_outline),
                withTextField: inputField
            )
            
            return field
        }()
        
        let fullnameTextField: TXTextInputField = {
            let inputField = TXTextField(
                withTag: TextField.fullnameField.rawValue,
                placeholder: "Full Name"
            )
            inputField.controllerDelegate = self
            
            let field = TXTextInputField(
                withImage: UIImage(named: ImageAsset.person_outline),
                withTextField: inputField
            )
            
            return field
        }()
        
        let usernameTextField: TXTextInputField = {
            let inputField = TXTextField(
                withTag: TextField.usernameField.rawValue,
                placeholder: "Username"
            )
            inputField.controllerDelegate = self
            
            let field = TXTextInputField(
                withImage: UIImage(named: ImageAsset.person_outline),
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
    
    private lazy var loginButton : TXTextButton = {
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
    
    private func verifyForm() -> Bool {
        if profileImage == nil {
            _showToast(message:"Select Profile image")
            return false
        }
        if email == nil {
            _showToast(message:"Enter email")
            return false
        }
        if password == nil {
            _showToast(message:"Enter password")
            return false
        }
        if fullname == nil {
            _showToast(message:"Enter fullname")
            return false
        }
        if username == nil {
            _showToast(message:"Enter username")
            return false
        }
        
        return true
    }
    
    private func onSignupPressed() {
        let isFormVerified = verifyForm()
        
        if isFormVerified {
            
            let request = TXCreateUserRequest(
                user: TXUser(
                    uid: "",
                    profileImage: profileImage,
                    profileImageUrl: "",
                    email: email!,
                    password: password!,
                    fullname: fullname!,
                    username: username!
                )
            )
            
            userRepository.createUser(with: request) {[weak self] result in
                switch result {
                case .success(let response):
                    print(response.user.uid)
                    break
                case .failure(let response):
                    self?._showToast(message: response.localizedDescription)
                    break
                }
            }
        }
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
    
    private func _showToast(message: String) {
        showToast(message: message,withBottomInset: 32)
    }
    
}

//MARK: - TXMediaDelegate

extension RegistrationController: TXMediaDelegate {
    
    func didImagePicked(image: UIImage) {
        addPhotoFieldView.setImage(image, for: .normal)
        profileImage = image
        
        addPhotoFieldView.toRoundedImage()
        addPhotoFieldView.withBorder()
    }
    
}

//MARK: - TXTextFieldDelegate

extension RegistrationController: TXTextFieldDelegate {
    
    private enum TextField: Int {
        case emailField = 0
        case passwordField = 1
        case fullnameField = 2
        case usernameField = 3
    }
    
    func didTextFieldChange(_ textField: UITextField) {
        let newText = textField.text
        
        switch textField.tag {
        case TextField.emailField.rawValue:
            onEmailChanged(newText)
            break
        case TextField.passwordField.rawValue:
            onPasswordChanged(newText)
            break
        case TextField.fullnameField.rawValue:
            onFullnameChanged(newText)
            break
        case TextField.usernameField.rawValue:
            onUsernameChanged(newText)
            break
        default:
            break
        }
    }
    
    private func onEmailChanged(_ text:String?){
        email = text
    }
    
    private func onPasswordChanged(_ text:String?){
        password = text
    }
    
    private func onFullnameChanged(_ text:String?){
       fullname = text
    }
    
    private func onUsernameChanged(_ text:String?){
        username = text
    }
}
