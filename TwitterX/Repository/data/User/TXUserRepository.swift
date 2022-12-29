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
    var delegate: TXUserRepositoryDelegate?
    
    static let createUserFunctionTag: String = "CreateUserFunction"
    func createUser(with request: TXCreateUserRequest) {
        Auth.auth().createUser(
            withEmail: request.user.email,
            password: request.user.password
        ){ (_ result: Firebase.AuthDataResult?, _ error: Error?) in
            if result == nil || error != nil {
                self.delegate?.didCreateUserFailed(
                    response: TXCreateUserFailure.init(
                        message: error?.localizedDescription ?? "Failed to create user"
                    )
                )
                return
            }
            
            guard let uuid = result?.user.uid else {
                
                assertionFailure("user uid not resived")
                
                return
            }
            
            var assetsRepository = TXAssetsRepository(tag:TXUserRepository.createUserFunctionTag)
            
            assetsRepository.delegate = self
            
            assetsRepository.uploadImage(
                with: TXUploadImageRequest(
                    uuid: uuid,
                    image: request.user.profileImage!
                )
            )
        }
    }
    
    func addUserDetails(with request: TXAddUserDetailsRequest) {
        Firestore.firestore()
            .collection("Users")
            .document(request.user.uid)
            .setData(request.toPayload()) { error in
                
            }
    }
}

extension TXUserRepository: TXAssetsRepositoryDelegate {
    func didUploadImageSuccess(tag:String,response: TXUploadImageSuccess){
        switch tag {
        case TXUserRepository.createUserFunctionTag:
            break
        default:
            break
        }
    }
    
    func didUploadImageFailure(tag:String,response: TXUploadImageFailure){
        
    }
}
