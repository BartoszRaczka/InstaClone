//
//  RegisterService.swift
//  InstaClone
//
//  Created by MacBook on 15/01/2021.
//

import Foundation
import Firebase

protocol RegisterServiceProtocol {
    
    func createUser(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void)
    
}

final class RegisterService: RegisterServiceProtocol {
    
    func createUser(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: userCredentials.email, password: userCredentials.password) { authResult, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(()))
        }
    }
    
    
}
