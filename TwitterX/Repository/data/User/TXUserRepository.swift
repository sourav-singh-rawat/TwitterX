//
//  TXUserRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import Foundation
import Firebase
import FirebaseAuth

class TXUserRepository: TXUserRepositoryProtocol {
    
    func createUser(with request: TXCreateUserRequest,completion: @escaping CreateUserCompletion) {
        
        //Adding details to auth
        
        Auth.auth().createUser(
            withEmail: request.user.email,
            password: request.user.password!
        ){ [weak self] (_ result: Firebase.AuthDataResult?, _ error: Error?) in
            
            guard let self = self else {
                return
            }
            
            if result == nil || error != nil {
                completion(.failure(
                    TXCreateUserFailure(
                        localizedDescription: error?.localizedDescription ?? "Failed to create user"
                    )
                ))
                return
            }
            
            //Get User uid
            
            guard let uuid = result?.user.uid else {
                
                assertionFailure("user uid not resived")
                
                return
            }
            
            let assetsRepository = TXAssetsRepository()
            
            assetsRepository.uploadImage(
                with: TXUploadImageRequest(
                    uuid: uuid,
                    image: request.user.profileImage!,
                    imageType: .profileImage
                )) { [weak self] result in
                    
                    switch result {
                    case .success(let response):
                        
                        self?.addUserDetails(
                            with: TXAddUserDetailsRequest(
                                user: TXUser(
                                    uid: uuid,
                                    profileImageUrl: response.imageUrl,
                                    email: request.user.email,
                                    fullname: request.user.fullname,
                                    username: request.user.username
                                )
                            )) { result in
                                switch result {
                                case .success(let response):
                                    completion(.success(
                                        TXCreateUserSuccess(user: response.user)
                                    ))
                                    break
                                case .failure(let response):
                                    completion(.failure(
                                        TXCreateUserFailure(
                                            localizedDescription: response.localizedDescription
                                        )
                                    ))
                                    break
                                }
                            }
                        break
                    case .failure(let response):
                        completion(.failure(
                            TXCreateUserFailure(
                                localizedDescription: response.localizedDescription
                            )
                        ))
                        break
                    }
                }
        }
    }
    
    func addUserDetails(with request: TXAddUserDetailsRequest,completion: @escaping AddUserDetailsCompletion) {
        Firestore.firestore()
            .collection("Users")
            .document(request.user.uid)
            .setData(request.toPayload()) { error in
                completion(.failure(
                    TXAddUserDetailsFailure(
                        localizedDescription: error?.localizedDescription ?? "Failed to add user details"
                    )
                ))
            }
        
        completion(.success(TXAddUserDetailsSuccess(user: request.user)))
    }
    
    func loginUser(with request: TXLoginUserRequest,completion: @escaping LoginUserCompletion) {
        Auth.auth().signIn(
            withEmail: request.email,
            password: request.password
        ) { result, error in
            if result == nil || error != nil {
                completion(.failure(
                    TXLoginUserFailure(
                        localizedDescription: error?.localizedDescription ?? "Failed to login"
                    )
                ))
            }
            
            guard let uuid = result?.user.uid else { return }
            
            
        }
    }
    
    func getUserDetails(with request: TXGetUserDetailsRequest,completion: @escaping GetUserDetailsCompletion) {
//        Firestore
//            .firestore()
//            .collection("Users")
//            .getDocuments { snapshot, error in
//                if snapshot == nil || error != nil {
//                    self.delegate?.didGetUserDetailsFailed(
//                        response: TXGetUserDetailsFailure(
//                            message: error?.localizedDescription ?? "Failed to get user details"
//                        )
//                    )
//                }
//
//            }
    }
}
