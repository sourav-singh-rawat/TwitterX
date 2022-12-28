//
//  TXMedia.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 27/12/22.
//

import UIKit

class TXMedia: TXMediaProtocol {
    var delegate: TXMediaDelegate?
    
    private let navigationController: TXNavigationController
    
    private let imagePicker = TXImagePickerController()
    
    required init(navigationController: TXNavigationController) {
        
        self.navigationController = navigationController
        
        imagePicker.controllerDelegate = self
    }
   
    func pickImage(
        isEditingAllowed: Bool = false
    ) {
        imagePicker.allowsEditing = isEditingAllowed
        
        navigationController.present(imagePicker, animated: true, completion: nil)
    }
}

extension TXMedia: TXImagePickerControllerDelegate {
    func didImagePicked(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let isEditedImage = picker.allowsEditing
        
        let imageType:UIImagePickerController.InfoKey = isEditedImage
        ?.editedImage
        :.originalImage
        
        guard let image = info[imageType] as? UIImage else {
            assertionFailure("Failed to pick image")
            navigationController.dismiss(animated: true)
            return
        }
        
        delegate?.didImagePicked(image: image)
        
        navigationController.dismiss(animated: true)
    }
}
