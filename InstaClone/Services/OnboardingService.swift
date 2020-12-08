//
//  OnboardingService.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation
import Firebase
import FirebaseAuth

protocol OnboardingServiceProtocol {
    
    func signUpNewUser(with email: String, password: String)
    func login(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void)
    
}

final class OnboardingService: OnboardingServiceProtocol {
    
    init() { //to jest potrzebne?
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            //...
        }
    }
    
    func signUpNewUser(with email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            //...
        }
    }
    
    func login(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: userCredentials.login, password: userCredentials.password) { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            //...
        }
        
        // This body was written just to test OnboardingViewModel, it should be rewrite with OnboardingService task
        let login: String = "123"
        let password: String = "asd"
        
        if userCredentials.login == login && userCredentials.password == password {
            completionHandler(.success(()))
        } else {
            completionHandler(.failure(ServiceError.failedToLogin))
        }
        
    }
    
}
