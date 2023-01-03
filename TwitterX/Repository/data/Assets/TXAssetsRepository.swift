//
//  TXAssetsRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import UIKit
import FirebaseStorage

struct TXAssetsRepository: TXAssetsRepositoryProtocol {
    private let storageRef = Storage.storage().reference()
    
    var uploadImageCompletion: UploadImageCompletion?
    func uploadImage(with request: TXUploadImageRequest,completion: @escaping UploadImageCompletion) {
        let payload = request.toPayload()
        
        let filePath = payload["filePath"] as! String
        let image = payload["image"] as! Data
        let metaData = payload["metaData"] as! StorageMetadata
        
        let storageLocationRef = storageRef.child(filePath)
        
        storageLocationRef.putData(image,metadata: metaData) { metaDataResult, error in
            if error != nil {
                completion(.failure(
                    TXUploadImageFailure(
                        localizedDescription: error?.localizedDescription ?? "Failed to upload image"
                    )
                ))
                return
            }
            
            storageLocationRef.downloadURL { url, error in
                if error != nil {
                    completion(.failure(
                        TXUploadImageFailure(
                            localizedDescription: error?.localizedDescription ?? "Server failure while image uploading"
                        )
                    ))
                    return
                }
                
                guard let url = url else {
                    assertionFailure("Url not recived from firebase")
                    return
                }
                
                completion(.success(
                    TXUploadImageSuccess(imageUrl: url.absoluteString)
                ))
            }
        }
    }
    
}
