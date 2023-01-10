//
//  TXTweetRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation
import Firebase

struct TXTweetRepository: TXTweetRepositoryProtocol {
    func uploadTweet(with request: TXUploadTweetRequest, completion: @escaping UploadTweetCompletion) {
        Firestore
            .firestore()
            .collection("Tweets")
            .addDocument(
                data: request.toPayload()
            ) {
                error in
                
                if let error  = error {
                    completion(
                        .failure(
                            TXUploadTweetFailure(localizedDescription: error.localizedDescription)
                        )
                    )
                }
            }
        
        completion(.success(TXUploadTweetSuccess()))
    }
}
