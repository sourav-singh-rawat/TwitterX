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
    
    func dowloadDataFromImageUrl(with request: TXDownloadDataFromImageUrlRequest,
                                 completion: @escaping DownloadDataFromImageUrlCompletion) {
        let session = URLSession(configuration: .default)
        
        let downloadImageTask = session.dataTask(with: request.url) { (data, response, error) in
            if let e = error {
                completion(
                    .failure(
                        TXDownloadDataFromImageUrlFailure(
                            localizedDescription: e.localizedDescription
                        )
                    )
                )
            } else {
                if let imageData = data {
                    completion(
                        .success(
                            TXDownloadDataFromImageUrlSuccess(
                                imageData: imageData
                            )
                        )
                    )
                } else {
                    completion(
                        .failure(
                            TXDownloadDataFromImageUrlFailure(
                                localizedDescription: "Couldn't get image: Image is nil"
                            )
                        )
                    )
                }
                
            }
        }
        
        downloadImageTask.resume()
    }
}
