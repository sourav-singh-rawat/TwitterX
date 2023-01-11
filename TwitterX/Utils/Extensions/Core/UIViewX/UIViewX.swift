//
//  UIViewX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIView {
    func enableAutoResizing(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showToast(
        message : String,
        font: UIFont = .systemFont(ofSize: 16.0),
        withBottomInset bottomInset: CGFloat = 0
    ) {

        let toastLabel:TXView = {
            let view = TXView()
            view.backgroundColor = TXTheme.shared.color.toast
            view.layer.cornerRadius = 10;
            view.clipsToBounds  =  true
            
            let label = TXLabel()
            label.textColor = TXTheme.shared.color.onToast
            label.font = font
            label.textAlignment = .center;
            label.text = message
            label.alpha = 1.0
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            
            view.addSubview(label)
            view.maxWidth(self.frame.width/1.2)
            label.position(
                in: view,
                withInsets: TXEdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8
                )
            )
            
            return view
        }()
        
        
        self.addSubview(toastLabel)
        toastLabel.alignment(
            to: self,
            alignment: .horizontalyCenter,
            withSafeAreaPortected: true
        )
        toastLabel.position(
            in: self,
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

struct TXEdgeInsets {
    let left: CGFloat
    let right: CGFloat
    let bottom: CGFloat
    let top: CGFloat
    
    static func symmetric(horizontal: CGFloat? = nil,vertical: CGFloat? = nil) -> TXEdgeInsets {
        return TXEdgeInsets(
            left: horizontal ?? -1,
            right: horizontal ?? -1,
            bottom: vertical ?? -1,
            top: vertical ?? -1
        )
    }
    
    static func all(_ value: CGFloat) -> TXEdgeInsets{
        return TXEdgeInsets(
            left: value,
            right: value,
            bottom: value,
            top: value
        )
    }
    
    static func only(
        left: CGFloat? = nil,
        right: CGFloat? = nil,
        bottom: CGFloat? = nil,
        top: CGFloat? = nil
    ) -> TXEdgeInsets {
        return TXEdgeInsets(
            left: left ?? -1,
            right: right ?? -1,
            bottom: bottom ?? -1,
            top: top ?? -1
        )
    }
}
