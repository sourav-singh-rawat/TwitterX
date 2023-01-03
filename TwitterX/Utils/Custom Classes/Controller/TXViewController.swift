//
//  TXViewController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

class TXViewController: UIViewController {
    func showToast(
        message : String,
        font: UIFont = .systemFont(ofSize: 16.0),
        withBottomInset bottomInset: CGFloat = 0
    ) {

        let toastLabel:TXView = {
            let view = TXView()
            view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            view.layer.cornerRadius = 10;
            view.clipsToBounds  =  true
            
            let label = TXLabel()
            label.textColor = UIColor.white
            label.font = font
            label.textAlignment = .center;
            label.text = message
            label.alpha = 1.0
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            
            view.addSubview(label)
            view.maxWidth(self.view.frame.width/1.2)
            label.position(
                in: view,
                withInsets: TXEdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8
                )
            )
            
            return view
        }()
        
        
        self.view.addSubview(toastLabel)
        toastLabel.alignment(
            to: self.view,
            alignment: .horizontalyCenter,
            withSafeAreaPortected: true
        )
        toastLabel.position(
            in: self.view,
            withInsets: TXEdgeInsets.only(
                bottom: bottomInset
            ),
            withSafeAreaProtected: true
        )
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
