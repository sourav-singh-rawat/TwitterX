//
//  TXTweetRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation
import Firebase

struct TXTweetRepository: TXTweetRepositoryProtocol {
    func getAllTweets(with request: TXGetAllTweetsRequest, completion: @escaping GetAllTweetsCompletion) {
        Firestore.firestore().collection("Tweets")
            .getDocuments {
                snapshot, error in
                
                if let error = error {
                    completion(
                        .failure(
                            TXGetAllTweetsFailure(localizedDescription: error.localizedDescription)
                        )
                    )
                } else if let snapshot = snapshot {
                    if snapshot.documents.isEmpty {
                        completion(
                            .failure(
                                TXGetAllTweetsFailure(localizedDescription: "No tweets found")
                            )
                        )
                        return
                    }
                    
                    var tweetList = [TXTweet]()
                    
                    for document in snapshot.documents {
                        let firebaseObj:[String:Any] = document.data()
                        
                        if let tweet = firebaseObj.toData()?.decode(to: TXTweet.self) {
                            tweetList.append(tweet)
                        }
                    }
                    
                    completion(.success(TXGetAllTweetsSuccess(tweets: tweetList)))
                }
        }
    }
    
    func uploadTweet(with request: TXUploadTweetRequest, completion: @escaping UploadTweetCompletion) {
        let newDocumentRef = Firestore.firestore().collection("Tweets").document()
        
        var payload = request.toPayload()
        payload["tid"] = newDocumentRef.documentID
        
        newDocumentRef.setData(payload) {
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
