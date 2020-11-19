//
//  UserProfileService.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import Firebase

protocol DatabaseRefereceFactoryProtocol {
    func getData(forPath path: String, completion: @escaping (DataSnapshot) -> Void)
}

struct DatabaseRefereceFactory: DatabaseRefereceFactoryProtocol {
    func getData(forPath path: String, completion: @escaping (DataSnapshot) -> Void) {
        let reference = Database.database().reference(withPath: path)
        reference.observeSingleEvent(of: .value) { snapshot in
            completion(snapshot)
        }
    }
}

protocol UserProfileServiceProtocol {
    func getUser(withID id: String, completionHandler: @escaping (Result<UserData, Error>) -> Void)
    func create(user: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void)
}

final class UserProfileService: UserProfileServiceProtocol {
    
    let factory: DatabaseRefereceFactoryProtocol
    
    init(factory: DatabaseRefereceFactoryProtocol) {
        self.factory = factory
    }
    
    func getUser(withID id: String, completionHandler: @escaping (Result<UserData, Error>) -> Void) {

        let reference = Database.database().reference(withPath: "users/\(id)")
        
        factory.getData(forPath: "users/\(id)") { snapshot in
            guard JSONSerialization.isValidJSONObject(snapshot.value as Any) else {
                completionHandler(.failure(ServiceError.jsonInvalid))
                return
            }
            
            guard
                let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any),
                let user = try? JSONDecoder().decode(UserData.self, from: data)
            else {
                completionHandler(.failure(ServiceError.failedToFetchUserData))
                return
            }
            completionHandler(.success(user))
        }
//
//        reference.observeSingleEvent(of: .value) { snapshot in
//            guard
//                JSONSerialization.isValidJSONObject(snapshot.value as Any),
//                let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any),
//                let user = try? JSONDecoder().decode(UserData.self, from: data)
//            else {
//                completionHandler(.failure(ServiceError.failedToFetchUserData))
//                return
//            }
//            completionHandler(.success(user))
//        }
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
