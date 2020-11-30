//
//  RegisterViewControllerFactory.swift
//  InstaClone
//
//  Created by MacBook on 29/11/2020.
//

import SnapKit

protocol RegisterViewControllerFactory {
    
    func makeRegisterViewController(delegate: RegisterViewModelDelegate) -> RegisterViewController
}

extension DependencyContainer: RegisterViewControllerFactory {
    
    func makeRegisterViewController(delegate: RegisterViewModelDelegate) -> RegisterViewController {
        RegisterViewController(with: makeRegisterViewModel(delegate: delegate))
    }
}
