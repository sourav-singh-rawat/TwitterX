//
//  TXTextView.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import UIKit

class TXTextView: UITextView {
    
    private var placeholderTextView: TXLabel = {
       let label = TXLabel()
        label.textColor = .darkGray
        return label
    }()
    
    var placeholderText: String {
        get {
            return self.placeholderText
        }
        set {
            placeholderTextView.text = newValue
            
            addSubview(placeholderTextView)
            
            placeholderTextView.position(
                in: self,
                withInsets: TXEdgeInsets.only(left: 4)
            )
            placeholderTextView.alignment(
                to: self,
                alignment: TXAlignment.verticalyCenter
            )
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = TXTheme.shared.color.background
        font = UIFont.systemFont(ofSize: 16)
        
        isScrollEnabled = false
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleTextInputChange),
            name: UITextView.textDidChangeNotification,
            object: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTextInputChange() {
        placeholderTextView.isHidden = !self.text.isEmpty
    }
}

