//
//  UIViewX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIView {
    func padding(
        to: UIView,
        insets: UIEdgeInsets,
        withSafeArea: Bool = false
    ){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(
                equalTo: withSafeArea
                    ?to.safeAreaLayoutGuide.topAnchor
                    :to.topAnchor,
                constant: insets.top ?? 0
            ),
            self.leadingAnchor.constraint(
                equalTo: withSafeArea
                    ?to.safeAreaLayoutGuide.leadingAnchor
                    :to.leadingAnchor,
                constant: insets.left ?? 0
            ),
            self.trailingAnchor.constraint(
                equalTo: withSafeArea
                    ?to.safeAreaLayoutGuide.trailingAnchor
                    :to.trailingAnchor,
                constant: -(insets.right ?? 0)
            ),
            self.bottomAnchor.constraint(
                equalTo: withSafeArea
                    ?to.safeAreaLayoutGuide.bottomAnchor
                    :to.bottomAnchor,
                constant: -(insets.bottom ?? 0)
            )
        ])
    }
    
    func width(_ width: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func height(_ height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
//    func minConstraint(
//        minWidth: CGFloat? = nil,
//        minHeight: CGFloat? = nil
//    ) {
//        translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            self.widthAnchor.constraint(greaterThanOrEqualToConstant: minWidth)
//        ])
//    }
}

struct UIEdgeInsets {
    let left: CGFloat?
    let right: CGFloat?
    let bottom: CGFloat?
    let top: CGFloat?
    
    var zero: UIEdgeInsets {
        return UIEdgeInsets(left: 0, right: 0, bottom: 0, top: 0)
    }
}
