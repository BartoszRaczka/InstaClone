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
    func listFiles(completionHandler: @escaping ((Result<[StorageReference], Error>) -> Void))
    func downloadPhotos(completionHandler: @escaping ((Result<PhotoList, Error>) -> Void))
    
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
    
    internal func listFiles(completionHandler: @escaping ((Result<[StorageReference], Error>) -> Void)) {
        let userID = Auth.auth().currentUser?.uid
        let reference = storage.reference().child("users/" + String(userID!) + "/photos")

        reference.listAll { (result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(result.items))
            }
        }
    }
    
    func downloadPhotos(completionHandler: @escaping ((Result<PhotoList, Error>) -> Void)) {
        let group = DispatchGroup()
        
        var referenceList: [StorageReference] = []
        group.enter()
        listFiles() { result in
            switch result {
            case let .failure(error):
                print(error)
                completionHandler(.failure(error))
                group.leave()
            case let .success(list):
                referenceList = list
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            var photoList: PhotoList = PhotoList()
            let group2 = DispatchGroup()
            
            for reference in referenceList {
                group2.enter()
                reference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let error = error {
                        completionHandler(.failure(error))
                    } else {
                        guard let data = data else {
                            completionHandler(.failure(ServiceError.failedToUnwrapData))
                            return
                        }
                        (photoList as PhotoList).photos.append(data)
                        group2.leave()
                    }
                }
            }
            group2.notify(queue: .main) {
                completionHandler(.success(photoList))
            }
        }
    }
}
