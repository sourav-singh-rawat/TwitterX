//
//  TXImagePickerController.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import UIKit

//MARK: - Porotcol

protocol TXImagePickerControllerDelegate {
    func didImagePicked(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
}

//MARK: - Controller

class TXImagePickerController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var controllerDelegate: TXImagePickerControllerDelegate?
    
    override func loadView() {
        super.loadView()
        
        delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        controllerDelegate?.didImagePicked(picker, didFinishPickingMediaWithInfo: info)
    }
}

//MARK: - Implementation

extension TXImagePickerControllerDelegate {
    
}
