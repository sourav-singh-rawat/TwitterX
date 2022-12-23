//
//  UIViewAlignmentX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 23/12/22.
//

import UIKit

extension UIView { 
    func alignment(
        to view: UIView,
        alignment: UIAlignment,
        withSafeAreaPortected safeAreaProtected: Bool = false
    ) {
        enableAutoResizing()
        
        switch alignment {
        
        case .topLeft:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(
                    left: 0,
                    top: 0
                ),
                withSafeAreaProtected: safeAreaProtected
            )
            break
        
        case .topCenter:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(
                    top: 0
                ),
                withSafeAreaProtected: safeAreaProtected
            )
            self.centerXAnchor.constraint(
                equalTo: safeAreaProtected
                ?view.safeAreaLayoutGuide.centerXAnchor
                :view.centerXAnchor
            ).isActive = true
            break
        
        case .topRight:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(
                    right: 0,
                    top: 0
                ),
                withSafeAreaProtected: safeAreaProtected
            )
            break
            
        case .centerLeft:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(left: 0),
                withSafeAreaProtected: safeAreaProtected
            )
            self.centerYAnchor.constraint(
                equalTo: safeAreaProtected
                ?view.safeAreaLayoutGuide.centerYAnchor
                :view.centerYAnchor
            ).isActive = true
            break
            
        case .center:
            NSLayoutConstraint.activate([
                self.centerXAnchor.constraint(
                    equalTo: safeAreaProtected
                    ?view.safeAreaLayoutGuide.centerXAnchor
                    :view.centerXAnchor
                ),
                self.centerYAnchor.constraint(
                    equalTo: safeAreaProtected
                    ?view.safeAreaLayoutGuide.centerYAnchor
                    :view.centerYAnchor
                )
            ])
            break
            
        case .centerRight:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(right: 0),
                withSafeAreaProtected: safeAreaProtected
            )
            self.centerYAnchor.constraint(
                equalTo: safeAreaProtected
                ?view.safeAreaLayoutGuide.centerYAnchor
                :view.centerYAnchor
            ).isActive = true
            break
            
        case .bottomLeft:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(
                    left: 0,
                    bottom: 0
                ),
                withSafeAreaProtected: safeAreaProtected
            )
            break
            
        case .bottomCenter:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(
                    bottom: 0
                ),
                withSafeAreaProtected: safeAreaProtected
            )
            self.centerXAnchor.constraint(
                equalTo: safeAreaProtected
                ?view.safeAreaLayoutGuide.centerXAnchor
                :view.centerXAnchor
            ).isActive = true
            break
            
        case .bottomRight:
            self.padding(
                to: view,
                withInsets: UIEdgeInsets.only(
                    right: 0,
                    bottom: 0
                ),
                withSafeAreaProtected: safeAreaProtected
            )
            break
            
        }
    }
}

enum UIAlignment {
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case center
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}
