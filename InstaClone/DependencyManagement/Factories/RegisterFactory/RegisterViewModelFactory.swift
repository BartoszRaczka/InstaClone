//
//  RegisterViewModelFactory.swift
//  InstaClone
//
//  Created by MacBook on 29/11/2020.
//

import Foundation

protocol RegisterViewModelFactory {
    
    func makeRegisterViewModel(delegate: RegisterViewModelDelegate) -> RegisterViewModel
    
}

extension DependencyContainer: RegisterViewModelFactory {
    
    func makeRegisterViewModel(delegate: RegisterViewModelDelegate) -> RegisterViewModel {
        RegisterViewModel(delegate: delegate)
    }
}
