//
//  TXTextField.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXTextField: UITextField, UITextFieldDelegate {
    required init(placeholder: String? = nil) {
        super.init(frame: .zero)
        delegate = self
        
        textColor = .white
        
        font = UIFont.systemFont(ofSize: 16)
        
        if(placeholder != nil){
            attributedPlaceholder = NSAttributedString(
                string: placeholder!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
//        delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("focused")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("lost focus")
    }
}
