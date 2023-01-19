//
//  TXButton.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXButton: UIButton {
    func addAction(handler: @escaping UIActionHandler, for controlEvents: UIControl.Event = .touchUpInside) {
        let action = UIAction(handler: handler)
        super.addAction(action, for: controlEvents)
    }
}
