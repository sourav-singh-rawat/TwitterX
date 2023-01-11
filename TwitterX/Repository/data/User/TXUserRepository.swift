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
                
                assertionFailure("user uid not recived")
                
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
                                case .success(_):
                                    TXAuth.shared.onLogin(uuid: uuid)
                                    
                                    completion(.success(
                                        TXCreateUserSuccess()
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
                if error != nil {
                    completion(.failure(
                        TXAddUserDetailsFailure(
                            localizedDescription: error?.localizedDescription ?? "Failed to add user details"
                        )
                    ))
                }
            }
        
        completion(.success(TXAddUserDetailsSuccess(user: request.user)))
    }
    
    func verifyLoginCreds(with request: TXVerifyLoginCredsRequest,completion: @escaping VerifyLoginCredsCompletion) {
        let user = Auth.auth().currentUser
        
        if user != nil {
            completion(.success(TXVerifyLoginCredsSuccess(uuid: user!.uid)))
        }else {
            completion(.failure(TXVerifyLoginCredsFailure(localizedDescription: "User is not loged in")))
        }
    }
    
    func loginUser(with request: TXLoginUserRequest,completion: @escaping LoginUserCompletion) {
        Auth.auth().signIn(
            withEmail: request.email,
            password: request.password
        ) {
            result, error in
            if result == nil || error != nil {
                completion(.failure(
                    TXLoginUserFailure(
                        localizedDescription: error?.localizedDescription ?? "Failed to login"
                    )
                ))
            }
            
            guard let uuid = result?.user.uid else { return }
            
            TXAuth.shared.onLogin(uuid: uuid)
            
            completion(.success(
                TXLoginUserSuccess()
            ))
        }
    }
    
    func getUserDetails(with request: TXGetUserDetailsRequest,completion: @escaping GetUserDetailsCompletion) {
        Firestore
            .firestore()
            .collection("Users")
            .document(request.uuid)
            .getDocument { document, error in
                if let document = document, document.exists, error == nil {
                    
                    guard let firestoreObj: [String:Any] = document.data() else {
                        completion(.failure(
                            TXGetUserDetailsFailure(
                                localizedDescription: "Data not stored for this user"
                            )
                        ))
                        return
                    }
                    
                    
                    if let user = firestoreObj.toData()?.decode(to: TXUser.self) {
                        
                        completion(.success(TXGetUserDetailsSuccess(user: user)))
                        
                    } else {
                        completion(.failure(
                            TXGetUserDetailsFailure(
                                localizedDescription: "Not able to decode server data"
                            )
                        ))
                    }
                }else {
                    completion(.failure(
                        TXGetUserDetailsFailure(
                            localizedDescription: error?.localizedDescription ?? "Failed to get user details"
                        )
                    ))
                }
            }
    }
    
    func logoutUser(with request: TXLogoutUserRequest,completion: @escaping LogoutUserCompletion) {
        do {
            try Auth.auth().signOut()
            
            TXAuth.shared.onLogout()
            
            completion(.success(TXLogoutUserSuccess()))
        } catch {
            completion(.failure(TXLogoutUserFailure(localizedDescription: error.localizedDescription)))
        }
    }
}
