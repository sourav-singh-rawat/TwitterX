//
//  UINavigationBarX.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 09/01/23.
//

import UIKit

extension UINavigationBar {
    func addBottomSeprator(){
        let line = TXView()
        line.height(0.6)
        line.backgroundColor = TXTheme.shared.color.navBarSeprater
        
        line.width(TXScreenSize.width)
        
        self.addSubview(line)
        
        line.alignment(
            to: self,
            alignment: TXAlignment.bottomCenter
        )
    }
}
