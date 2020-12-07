//
//  OnboardingService.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol OnboardingServiceProtocol {
    
    func login(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void)
    
}

final class OnboardingService: OnboardingServiceProtocol {
    
    func login(with userCredentials: UserCredentials, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        
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
