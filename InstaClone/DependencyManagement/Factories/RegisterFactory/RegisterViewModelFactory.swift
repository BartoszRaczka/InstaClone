//
//  RegisterViewModelFactory.swift
//  InstaClone
//
//  Created by MacBook on 29/11/2020.
//

import Foundation

protocol RegisterViewModelFactory {
    
    func makeRegisterViewModel(delegate: RegisterViewModelDelegate, registerService: RegisterServiceProtocol) -> RegisterViewModel
    
}

extension DependencyContainer: RegisterViewModelFactory {
    
    func makeRegisterViewModel(delegate: RegisterViewModelDelegate, registerService: RegisterServiceProtocol) -> RegisterViewModel {
        RegisterViewModel(
            delegate: delegate,
            registerService: registerService)
    }
}
