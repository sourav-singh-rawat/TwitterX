//
//  TXButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

typealias OnPressedTXButton = () -> Void

class TXButton: UIButton {
    var onPressedCallback: OnPressedTXButton
    
    required init(
        onPressed: @escaping OnPressedTXButton
    ){
        onPressedCallback = onPressed
        super.init(frame: .zero)
        
        addTarget(self, action: #selector(self.onPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onPressed() {
        onPressedCallback()
    }
}
