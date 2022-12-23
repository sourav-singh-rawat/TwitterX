//
//  UIViewPaddingX.swift
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
        enableAutoResizing()
        
        var constraints: [NSLayoutConstraint] = []
        
        if insets.top != -1 {
            constraints.append(
                self.topAnchor.constraint(
                    equalTo: safeAreaProtected
                    ?view.safeAreaLayoutGuide.topAnchor
                    :view.topAnchor,
                    constant: insets.top
                )
            )
        }
        
        if insets.left != -1 {
            constraints.append(
                self.leadingAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.leadingAnchor
                        :view.leadingAnchor,
                    constant: insets.left
                )
            )
        }
        
        if insets.right != -1 {
            constraints.append(
                self.trailingAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.trailingAnchor
                        :view.trailingAnchor,
                    constant: -(insets.right)
                )
            )
        }
        
        if insets.bottom != -1 {
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
}

struct UIEdgeInsets {
    let left: CGFloat
    let right: CGFloat
    let bottom: CGFloat
    let top: CGFloat
    
    static func symmetric(horizontal: CGFloat? = nil,vertical: CGFloat? = nil) -> UIEdgeInsets {
        return UIEdgeInsets(
            left: horizontal ?? -1,
            right: horizontal ?? -1,
            bottom: vertical ?? -1,
            top: vertical ?? -1
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
    
    static func only(
        left: CGFloat? = nil,
        right: CGFloat? = nil,
        bottom: CGFloat? = nil,
        top: CGFloat? = nil
    ) -> UIEdgeInsets {
        return UIEdgeInsets(
            left: left ?? -1,
            right: right ?? -1,
            bottom: bottom ?? -1,
            top: top ?? -1
        )
    }
}
