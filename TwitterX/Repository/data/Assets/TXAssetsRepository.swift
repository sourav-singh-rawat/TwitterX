//
//  TXAssetsRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import UIKit
import FirebaseStorage

struct TXAssetsRepository: TXAssetsRepositoryProtocol {
    let tag: String
    
    var delegate: TXAssetsRepositoryDelegate?
    
    private let storageRef = Storage.storage().reference()
    
    func uploadImage(with request: TXUploadImageRequest) {
        let payload = request.toPayload()
        
        let filePath = payload["filePath"] as! String
        let image = payload["image"] as! Data
        let metaData = payload["metaData"] as! StorageMetadata
        
        let storageLocationRef = storageRef.child(filePath)
        
        let val = storageLocationRef.putData(image,metadata: metaData) { metaDataResult, error in
            if error != nil {
                delegate?.didUploadImageFailure(
                    tag: self.tag,
                    response: TXUploadImageFailure(
                        message: error?.localizedDescription ?? "Failed to upload image"
                    )
                )
                return
            }
            
            storageLocationRef.downloadURL { url, error in
                if error != nil {
                    delegate?.didUploadImageFailure(
                        tag: self.tag,
                        response: TXUploadImageFailure(
                            message: error?.localizedDescription ?? "Server failure"
                        )
                    )
                    return
                }
                
                guard let url = url else {
                    assertionFailure("Url not recived from firebase")
                    return
                }
                
                delegate?.didUploadImageSuccess(
                    tag: self.tag,
                    response: TXUploadImageSuccess(imageUrl: url.absoluteString)
                )
            }
        }
    }
    
}
