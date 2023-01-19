//
//  TXTextInputField.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXTextInputField: TXView {
    fileprivate var textInputRow: TXTextInputRow
    
    let textField: TXTextField
    
    private let dividerView: TXView = {
        let view = TXView()
        view.backgroundColor = TXTheme.shared.color.onPrimary
        view.height(1)
        
        return view
    }()
    
    init(
        withImage image: UIImage? = nil,
        withTextField textField: TXTextField,
        height: CGFloat = 50
    ) {
        self.textInputRow = TXTextInputRow(
            withImage: image,
            withTextField: textField
        )
        
        self.textField = textField
        
        super.init(frame: .zero)
        
        configureUI()
        
        self.height(height)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(textInputRow)
        textInputRow.alignment(
            to: self, alignment: TXAlignment.centerLeft
        )

        addSubview(dividerView)
        dividerView.position(
            in: self,
            withInsets: TXEdgeInsets.only(
                left: 0,
                right: 0,
                bottom: 0
            )
        )
    }
}

fileprivate class TXTextInputRow: TXStackView {
    var image: UIImage?
    var textField: TXTextField
    
    lazy var prefixImageView: TXImageView = {
        let imgView = TXImageView()
        imgView.setImage(
            image: self.image!,
            width: 24,
            height: 24
        )
        
        return imgView
    }()
    
    
    init(
        withImage image: UIImage? = nil,
        withTextField textField: TXTextField
    ) {
        self.image = image
        self.textField = textField
        
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        axis = .horizontal
        spacing = 8
        
        if(self.image != nil){
            addArrangedSubview(prefixImageView)
        }
        
        addArrangedSubview(textField)
    }
}
