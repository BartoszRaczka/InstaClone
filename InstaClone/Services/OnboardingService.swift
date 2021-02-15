//
//  OnboardingService.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation
import FirebaseAuth

protocol OnboardingServiceProtocol {
    
    func login(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void)
    
}

final class OnboardingService: OnboardingServiceProtocol {

    func login(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: userCredentials.login, password: userCredentials.password) { [weak self] authResult, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(()))
        }
    }
    
}
