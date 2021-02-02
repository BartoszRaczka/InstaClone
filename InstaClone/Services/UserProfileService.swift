//
//  UserProfileService.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

protocol UserProfileServiceProtocol {
    
    func getUser(withID id: String, completionHandler: @escaping (Result<UserData, Error>) -> Void)
    func create(user: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void)
    func listFiles(completionHandler: @escaping ((Result<PhotoList, Error>) -> Void))
    
}

final class UserProfileService: UserProfileServiceProtocol {
    
    private let storage = Storage.storage()
    
    func getUser(withID id: String, completionHandler: @escaping (Result<UserData, Error>) -> Void) {

        let reference = Database.database().reference(withPath: "users/\(id)")
        
        reference.observeSingleEvent(of: .value) { snapshot in
            guard
                JSONSerialization.isValidJSONObject(snapshot.value as Any),
                let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any),
                let user = try? JSONDecoder().decode(UserData.self, from: data)
            else {
                completionHandler(.failure(ServiceError.failedToFetchUserData))
                return
            }
            completionHandler(.success(user))
        }
    }
    
    func create(user: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        guard
            let userData = try? JSONEncoder().encode(user),
            let userJSON = try? JSONSerialization.jsonObject(with: userData, options: [])
        else {
            completionHandler(.failure(ServiceError.failedToEncodeUserData))
            return
        }
        completionHandler(.success(()))
        
        let reference = Database.database().reference(withPath: "users/\(user.id)")
        reference.setValue(userJSON) { error, reference in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(()))
            }
        }
    }
    
    func listFiles(completionHandler: @escaping ((Result<PhotoList, Error>) -> Void)) {
        
        let userID = Auth.auth().currentUser?.uid
        let reference = storage.reference().child("users/" + String(userID!) + "/photos")

        reference.listAll { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
                print("error")
            } else {
                guard
                    JSONSerialization.isValidJSONObject(result.items as Any),
                    let data = try? JSONSerialization.data(withJSONObject: result.items as Any),
                    let photoList = try? JSONDecoder().decode(PhotoList.self, from: data)
                else {
                    completionHandler(.failure(ServiceError.failedToListPhotos))
                    return
                }
                completionHandler(.success(photoList))
            }
        
        }
        
    }
    
}
