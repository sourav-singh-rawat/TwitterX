//
//  TXTextInputField.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXTextInputField: TXView {
    fileprivate var textInputRow: TXTextInputRow
    
    let dividerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.height(1)
        
        return view
    }()
    
    init(
        withImage image: UIImage? = nil,
        withTextField textField: TXTextField
    ) {
        self.textInputRow = TXTextInputRow(
            withImage: image,
            withTextField: textField
        )
        
        super.init(frame: .zero)
        
        configureUI()
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
    
    let prefixImageView: TXImageView = {
        let imgView = TXImageView()
        
        imgView.width(24)
        imgView.height(24)
        
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
            prefixImageView.image = self.image
        }
        
        addArrangedSubview(textField)
    }
}
