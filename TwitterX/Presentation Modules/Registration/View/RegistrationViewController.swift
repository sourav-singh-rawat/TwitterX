//
//  RegistrationViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 17/01/23.
//  
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterRegistrationProtocol?
    
    private lazy var registrationFormViewController: RegistrationFormViewController = {
       let viewController = RegistrationFormViewController()
        viewController.presenter = presenter
        
        return viewController
    }()
    
    private lazy var loginButton : TXTextButton = {
        let attributedTitle = NSMutableAttributedString(
            string: "Already have an account? ",
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: TXTheme.shared.color.onPrimary
            ]
        )
        
        attributedTitle.append(
            NSMutableAttributedString(
                string: "Log In",
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
            
            self.presenter?.loginExistingUser()
        }
        
        return btn
    }()
    
    private func configureUI(){
        view.backgroundColor = TXTheme.shared.color.primary
        
        addChildControllerSubview(registrationFormViewController)

        view.addSubview(loginButton)
        loginButton.alignment(
            to: view,
            alignment: TXAlignment.bottomCenter,
            withSafeAreaPortected: true
        )
    }
    
    private func _showToast(message: String) {
        view.showToast(message: message,withBottomInset: 32)
    }

}

extension RegistrationViewController: PresenterToViewRegistrationProtocol {
    func profileImagePicked(image: UIImage) {
        registrationFormViewController.delegate?.setPickedProfileImage(image)
    }
    
    func registerUserSuccess() {
        registrationFormViewController.delegate?.stopLoadingSignupButton()
    }
    
    func registerUserFailure(error: String) {
        registrationFormViewController.delegate?.stopLoadingSignupButton()
        _showToast(message: error)
    }
}


