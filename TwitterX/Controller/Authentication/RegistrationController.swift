//
//  RegistrationController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 26/12/22.
//

import UIKit

class RegistrationController: UIViewController {
    
    //MARK: - Properties
    
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
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    private func onLoginPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper
    
    private func configureUI(){
        view.backgroundColor = .twitterBlue
        
        view.addSubview(loginButton)
        loginButton.alignment(
            to: view,
            alignment: TXAlignment.bottomCenter,
            withSafeAreaPortected: true
        )
    }
    
}
