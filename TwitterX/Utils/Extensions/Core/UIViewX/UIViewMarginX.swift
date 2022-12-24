//
//  UIViewMarginX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 25/12/22.
//

import UIKit

extension UIView {
    
    func margin(
        to view: UIView,
        withInsets insets: UIEdgeInsets,
        withSafeAreaProtected safeAreaProtected: Bool = false
    ){
        enableAutoResizing()
        
        var constraints: [NSLayoutConstraint] = []
        
        if insets.top != -1 {
            constraints.append(
                self.bottomAnchor.constraint(
                    equalTo: safeAreaProtected
                    ?view.safeAreaLayoutGuide.topAnchor
                    :view.topAnchor,
                    constant: insets.top
                )
            )
        }
        
        if insets.left != -1 {
            constraints.append(
                self.trailingAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.leadingAnchor
                        :view.leadingAnchor,
                    constant: insets.left
                )
            )
        }
        
        if insets.right != -1 {
            constraints.append(
                self.leadingAnchor.constraint(
                    equalTo: safeAreaProtected
                        ?view.safeAreaLayoutGuide.trailingAnchor
                        :view.trailingAnchor,
                    constant: -(insets.right)
                )
            )
        }
        
        if insets.bottom != -1 {
            constraints.append(
                self.topAnchor.constraint(
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


