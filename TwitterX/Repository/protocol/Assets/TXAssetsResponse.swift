//
//  TXAssetsResponse.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import Foundation

protocol TXAssetsFailureProtocol: TXRepositoryFailureProtocol {
    
}

protocol TXAssetsSuccessProtocol: TXRepositorySuccessProtocol {
    
}

struct TXUploadImageFailure: TXAssetsFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXUploadImageSuccess: TXAssetsSuccessProtocol {
    var message: String?
    let imageUrl: String
}

struct TXDownloadDataFromImageUrlFailure: TXAssetsFailureProtocol {
    var statusCode: Int?
    
    var localizedDescription: String
}

struct TXDownloadDataFromImageUrlSuccess: TXAssetsSuccessProtocol {
    var message: String?
    let imageData: Data
}
