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
    var message: String
    var statusCode: Int?
}

struct TXUploadImageSuccess: TXAssetsSuccessProtocol {
    var message: String?
    let imageUrl: String
}
