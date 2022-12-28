//
//  TXMediaProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 27/12/22.
//

import UIKit

//MARK: - Protocol

protocol TXMediaProtocol {
    func pickImage(
        isEditingAllowed: Bool
    )
}

//MARK: - Delegate

protocol TXMediaDelegate {
    func didImagePicked(image: UIImage)
}

//MARK: - Implementation

extension TXMediaDelegate {
    func didImagePicked(image: UIImage) {
        //
    }
}
