//
//  TXAssetsRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import Foundation

typealias UploadImageCompletion = (Result<TXUploadImageSuccess,TXUploadImageFailure>)->Void

protocol TXAssetsRepositoryProtocol: TXRepositoryProtocol {
    func uploadImage(
        with request: TXUploadImageRequest,
        completion: @escaping UploadImageCompletion
    )
}
