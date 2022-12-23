//
//  UIViewX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIView {
    func padding(
        to view: UIView,
        withInsets insets: UIEdgeInsets,
        withSafeAreaProtected safeAreaProtected: Bool = false
    ){
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        if insets.top != 0 {
            constraints.append(
                self.topAnchor.constraint(
                    equalTo: safeAreaProtected
                    ?view.safeAreaLayoutGuide.topAnchor
                    :view.topAnchor,
                    constant: insets.top
                )
            )
        }
        
        if insets.left != 0 {
            constraints.append(
                self.leadingAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.leadingAnchor
                        :view.leadingAnchor,
                    constant: insets.left
                )
            )
        }
        
        if insets.right != 0 {
            constraints.append(
                self.trailingAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.trailingAnchor
                        :view.trailingAnchor,
                    constant: -(insets.right)
                )
            )
        }
        
        if insets.bottom != 0 {
            constraints.append(
                self.bottomAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.bottomAnchor
                        :view.bottomAnchor,
                    constant: -(insets.bottom)
                )
            )
        }
        
        NSLayoutConstraint.activate(constraints)
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
    let left: CGFloat
    let right: CGFloat
    let bottom: CGFloat
    let top: CGFloat
    
    static var zero: UIEdgeInsets {
        return UIEdgeInsets(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0
        )
    }
    
    static func symmetric(horizontal: CGFloat? = nil,vertical: CGFloat? = nil) -> UIEdgeInsets {
        return UIEdgeInsets(
            left: horizontal ?? 0,
            right: horizontal ?? 0,
            bottom: vertical ?? 0,
            top: vertical ?? 0
        )
    }
    
    static func all(_ value: CGFloat) -> UIEdgeInsets{
        return UIEdgeInsets(
            left: value,
            right: value,
            bottom: value,
            top: value
        )
    }
    
    static func only(left: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, top: CGFloat? = nil) -> UIEdgeInsets {
        return UIEdgeInsets(
            left: left ?? 0,
            right: right ?? 0,
            bottom: bottom ?? 0,
            top: top ?? 0
        )
    }
}
