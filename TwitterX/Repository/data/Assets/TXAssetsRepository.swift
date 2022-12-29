//
//  TXAssetsRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import UIKit
import FirebaseStorage

struct TXAssetsRepository: TXAssetsRepositoryProtocol {
    var delegate: TXAssetsRepositoryDelegate?
    
    private let storageRef = Storage.storage().reference()
    
    func uploadImage(with request: TXUploadImageRequest) {
        let payload = request.toPayload()
        
        let filePath = payload["filePath"] as! String
        let image = payload["image"] as! Data
        let metaData = payload["metaData"] as! StorageMetadata
        
        let storageLocationRef = storageRef.child(filePath)
        
        storageLocationRef.putData(image,metadata: metaData) { metaDataResult, error in
            if error != nil {
                delegate?.didUploadImageFailure(
                    response: TXUploadImageFailure(
                        message: error?.localizedDescription ?? "Failed to upload image"
                    )
                )
                return
            }
            
            storageLocationRef.downloadURL { url, error in
                if error != nil {
                    delegate?.didUploadImageFailure(
                        response: TXUploadImageFailure(
                            message: error?.localizedDescription ?? "Can't detect image after saving in server"
                        )
                    )
                    return
                }
                
                guard let url = url else {
                    delegate?.didUploadImageFailure(
                        response: TXUploadImageFailure(
                            message: "Url is not provided by server, Server Error"
                        )
                    )
                    return
                }
                
                delegate?.didUploadImageSuccess(
                    response: TXUploadImageSuccess(imageUrl: url.absoluteString)
                )
            }
            
            
        }
    }
    
}
