//
//  TXTweetRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 10/01/23.
//

import Foundation
import Firebase

struct TXTweetRepository: TXTweetRepositoryProtocol {
    func fetchTweets(with request: TXFetchTweetsRequest, completion: @escaping FetchTweetsCompletion) {
        Firestore.firestore().collection("Tweets")
            .getDocuments {
                snapshot, error in
                
                if let error = error {
                    completion(
                        .failure(
                            TXFetchTweetsFailure(localizedDescription: error.localizedDescription)
                        )
                    )
                } else if let snapshot = snapshot {
                    if snapshot.documents.isEmpty {
                        completion(
                            .failure(
                                TXFetchTweetsFailure(localizedDescription: "No tweets found")
                            )
                        )
                        return
                    }
                    
                    var tweetList = [TXTweet]()
                    
                    for document in snapshot.documents {
                        var firebaseObj:[String:Any] = document.data()
                        
                        let uuid = firebaseObj["uuid"] as! String
                        
                        let userRepository = TXUserRepository()
                        userRepository.getUserDetails(
                            with: TXGetUserDetailsRequest(uuid: uuid)
                        ) {
                            result in
                            
                            switch result{
                            case .success(let response):
                                let user = response.user
                                
                                firebaseObj["user"] = TXHelper.encode(value: user)?.toJSON()
                                
                                if let tweet = firebaseObj.toData()?.decode(to: TXTweet.self) {
                                    tweetList.append(tweet)
                                }
                                
                                completion(.success(TXFetchTweetsSuccess(tweets: tweetList)))
                                break
                            case .failure(let response):
                                print(response.localizedDescription)
                                break
                            }
                        }
                    }
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
