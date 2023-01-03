//
//  TXUserRepository.swift
//  TwitterX
//
//  Created by Sourav Singh Rawat on 28/12/22.
//

import Foundation
import Firebase
import FirebaseAuth

typealias AddUserDetailsCompletion = (Result<TXUser,TXError>) -> Void

class TXUserRepository: TXUserRepositoryProtocol {
    
    var delegate: TXUserRepositoryDelegate?
    
    func createUser(with request: TXCreateUserRequest) {
        var assetsRepository = TXAssetsRepository()
        
        func uploadProfileDetails(uuid: String){
            assetsRepository.uploadImageCompletion = { result in
                switch result {
                case .success(let url):
                    
                    addUserDetailsToDatabase(uuid: uuid,imageUrl: url)
                    
                    break
                case .failure(let error):
                    assertionFailure(error.localizedDescription)
                    break
                }
            }
            
            uploadProfileImage(uuid: uuid)
        }
        
        func uploadProfileImage(uuid:String){
            assetsRepository.uploadImage(
                with: TXUploadImageRequest(
                    uuid: uuid,
                    image: request.user.profileImage!,
                    imageType: .profileImage
                )
            )
        }
        
        func addUserDetailsToDatabase(uuid: String,imageUrl url:String){
            self.addUserDetailsCompletion = { result in
                switch result {
                case .success(let user):
                    self.delegate?.didCreateUserSuccess(
                        response: TXCreateUserSuccess(
                            user: user
                        )
                    )
                    break
                case .failure(let error):
                    self.delegate?.didCreateUserFailed(
                        response: TXCreateUserFailure(
                            message: error.localizedDescription
                        )
                    )
                }
            }
            
            self.addUserDetails(
                with: TXAddUserDetailsRequest(
                    user: TXUser(
                        uid: uuid,
                        profileImageUrl: url,
                        email: request.user.email,
                        fullname: request.user.fullname,
                        username: request.user.username
                    )
                )
            )
        }
        
        //Adding details to auth
        
        Auth.auth().createUser(
            withEmail: request.user.email,
            password: request.user.password!
        ){ [weak self] (_ result: Firebase.AuthDataResult?, _ error: Error?) in
            
            guard let self = self else {
                return
            }
            
            if result == nil || error != nil {
                self.delegate?.didCreateUserFailed(
                    response: TXCreateUserFailure(
                        message: error?.localizedDescription ?? "Failed to create user"
                    )
                )
                return
            }
            
            //Get User uid
            
            guard let uuid = result?.user.uid else {
                
                assertionFailure("user uid not resived")
                
                return
            }
            
            uploadProfileDetails(uuid: uuid)
        }
    }
    
    
    var addUserDetailsCompletion: AddUserDetailsCompletion?
    func addUserDetails(with request: TXAddUserDetailsRequest) {
        Firestore.firestore()
            .collection("Users")
            .document(request.user.uid)
            .setData(request.toPayload()) { [weak self] error in
                guard let self = self else {
                    return
                }
                
                let _error = TXError(
                    localizedDescription: error?.localizedDescription ?? "Failed to add user details"
                )
                
                self.delegate?.didAddUserDetailsFailed(
                    response: TXAddUserDetailsFailure(
                        message: _error.localizedDescription
                    )
                )
                
                self.addUserDetailsCompletion?(.failure(_error))
            }
        
        delegate?.didAddUserDetailsSuccess(
            response: TXAddUserDetailsSuccess(user: request.user)
        )
        
        addUserDetailsCompletion?(.success(request.user))
    }
    
    func loginUser(with request: TXLoginUserRequest) {
        
    }
}
