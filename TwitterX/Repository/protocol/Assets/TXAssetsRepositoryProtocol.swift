//
//  TXAssetsRepositoryProtocol.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 29/12/22.
//

import Foundation

//MARK: - Repository

protocol TXAssetsRepositoryProtocol: TXRepositoryProtocol {
    func uploadImage(with request: TXUploadImageRequest)
}

//MARK: - Delegate

protocol TXAssetsRepositoryDelegate {
    func didUploadImageSuccess(tag: String,response: TXUploadImageSuccess)
    func didUploadImageFailure(tag: String,response: TXUploadImageFailure)
}

extension TXAssetsRepositoryDelegate {
    func didUploadImageSuccess(response: TXUploadImageSuccess){
        
    }
    func didUploadImageFailure(response: TXUploadImageFailure){
        
    }
}
