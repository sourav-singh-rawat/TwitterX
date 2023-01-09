//
//  TXAssetsRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import Foundation

typealias UploadImageCompletion = (Result<TXUploadImageSuccess,TXUploadImageFailure>)->Void
typealias DownloadDataFromImageUrlCompletion = (Result<TXDownloadDataFromImageUrlSuccess,TXDownloadDataFromImageUrlFailure>)->Void

protocol TXAssetsRepositoryProtocol: TXRepositoryProtocol {
    func uploadImage(
        with request: TXUploadImageRequest,
        completion: @escaping UploadImageCompletion
    )
    
    func dowloadDataFromImageUrl(
        with request: TXDownloadDataFromImageUrlRequest,
        completion: @escaping DownloadDataFromImageUrlCompletion
    )
}
