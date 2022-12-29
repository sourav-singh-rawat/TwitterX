//
//  TXTextField.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

protocol TXTextFieldDelegate {
    func didTextFieldChange(_ textField: UITextField)
}

class TXTextField: UITextField, UITextFieldDelegate {
    var controllerDelegate: TXTextFieldDelegate?
    
    required init(withTag tag: Int,placeholder: String? = nil) {
        super.init(frame: .zero)
        delegate = self
        
        textColor = .white
        
        self.tag = tag
        
        font = UIFont.systemFont(ofSize: 16)
        
        if(placeholder != nil){
            attributedPlaceholder = NSAttributedString(
                string: placeholder!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        }
        
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
//        delegate = self
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        controllerDelegate?.didTextFieldChange(textField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("focused")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("lost focus")
    }
}
