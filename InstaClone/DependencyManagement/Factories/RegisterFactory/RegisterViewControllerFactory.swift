//
//  RegisterViewControllerFactory.swift
//  InstaClone
//
//  Created by MacBook on 29/11/2020.
//

import SnapKit

protocol RegisterViewControllerFactory {
    
    func makeRegisterViewController(delegate: RegisterViewModelDelegate, registerService: RegisterServiceProtocol) -> RegisterViewController
    
}

extension DependencyContainer: RegisterViewControllerFactory {
    
    func makeRegisterViewController(delegate: RegisterViewModelDelegate, registerService: RegisterServiceProtocol) -> RegisterViewController {
        RegisterViewController(with: makeRegisterViewModel(delegate: delegate, registerService: registerService))
    }
}
