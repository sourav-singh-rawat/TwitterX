//
//  TXAssetsRequest.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import UIKit
import FirebaseStorage

enum ImageType: String {
    case profileImage = "profileImage"
    case other = "uploadImage"
}

struct TXUploadImageRequest: TXRepositoryRequest {
    let uuid: String
    let image: UIImage
    let imageType: ImageType
    
    func toPayload() -> [String:Any]  {
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        return [
            "filePath":"\(uuid)/\(imageType.rawValue)",
            "image": image.jpegData(compressionQuality: 0.8)!,
            "metaData": metaData
        ]
    }
}

struct TXDownloadDataFromImageUrlRequest: TXRepositoryRequest {
    let urlString: String
    
    var url: URL {
        get {
            return URL(string: urlString)!
        }
    }
    
    func toPayload() -> [String : Any] {
        return [:]
    }
}
