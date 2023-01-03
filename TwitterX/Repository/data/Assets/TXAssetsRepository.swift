//
//  TXAssetsRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import UIKit
import FirebaseStorage

typealias UploadImageCompletion = ((Result<String,TXError>)->Void)

struct TXAssetsRepository: TXAssetsRepositoryProtocol {
    
    var delegate: TXAssetsRepositoryDelegate?
    
    private let storageRef = Storage.storage().reference()
    
    var uploadImageCompletion: UploadImageCompletion?
    func uploadImage(with request: TXUploadImageRequest) {
        let payload = request.toPayload()
        
        let filePath = payload["filePath"] as! String
        let image = payload["image"] as! Data
        let metaData = payload["metaData"] as! StorageMetadata
        
        let storageLocationRef = storageRef.child(filePath)
        
        let val = storageLocationRef.putData(image,metadata: metaData) { metaDataResult, error in
            if error != nil {
                
                let _error = TXError(localizedDescription: error?.localizedDescription ?? "Failed to upload image")
                
                delegate?.didUploadImageFailure(
                    response: TXUploadImageFailure(
                        message: _error.localizedDescription
                    )
                )
                
                uploadImageCompletion?(.failure(_error))
                return
            }
            
            storageLocationRef.downloadURL { url, error in
                if error != nil {
                    
                    let _error = TXError(localizedDescription: error?.localizedDescription ?? "Server failure while image uploading")
                    
                    delegate?.didUploadImageFailure(
                        response: TXUploadImageFailure(
                            message: _error.localizedDescription
                        )
                    )
                    
                    uploadImageCompletion?(.failure(_error))
                    return
                }
                
                guard let url = url else {
                    assertionFailure("Url not recived from firebase")
                    return
                }
                
                delegate?.didUploadImageSuccess(
                    response: TXUploadImageSuccess(imageUrl: url.absoluteString)
                )
                
                uploadImageCompletion?(.success(url.absoluteString))
            }
        }
    }
    
}
