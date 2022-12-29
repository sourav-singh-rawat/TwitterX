//
//  TXAssetsRequest.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import UIKit
import FirebaseStorage

struct TXUploadImageRequest: TXRepositoryRequest {
    let uuid: String
    let image: UIImage
    
    func toPayload() -> [String:Any]  {
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        return [
            "filePath":"\(uuid)/\("profilePhoto")",
            "image": image.jpegData(compressionQuality: 0.8)!,
            "metaData": metaData
        ]
    }
}
