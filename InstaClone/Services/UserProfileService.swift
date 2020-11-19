//
//  UserProfileService.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import Firebase

protocol UserProfileServiceProtocol {
    func getUser(withID id: String, completionHandler: @escaping (Result<UserData, Error>) -> Void)
    func create(user: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void)
}

final class UserProfileService: UserProfileServiceProtocol {
    
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
        let userData = try! JSONEncoder().encode(user) // bez "!"
        let userJSON = try! JSONSerialization.jsonObject(with: userData, options: [])

        let reference = Database.database().reference(withPath: "users/\(user.id)")
        reference.setValue(userJSON) { error, reference in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(()))
            }
        }
    }
    
}
