//
//  OnboardingViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol OnboardingViewModelDelegate {
    
    func loginButtonTapped(login: String, password: String)
    func registerButtonTapped()
    
}

class OnboardingViewModel {
    
    var delegate: OnboardingViewModelDelegate?
    var login: String
    var password: String
    var passwordTextFieldViewModel: TextFieldViewModel?
    var loginTextFieldViewModel: TextFieldViewModel?
    
    init(login: String, password: String, delegate: OnboardingViewModelDelegate) {
        self.login = login
        self.password = password
        self.delegate = delegate
    }
}

// MARK: - Public methods
extension OnboardingViewModel: TextFieldViewModelDelegate {
    
    func textFieldDidChange(in textFieldType: TextFieldType, with typedText: String) {
        switch textFieldType {
        case .login:
            self.login = typedText
        case .password:
            self.password = typedText
        }
    }
    
    func loginButtonTapped() {
        loginTextFieldViewModel?.stopEditing()
        passwordTextFieldViewModel?.stopEditing()
        guard
            self.login != "",
            self.password != ""
        else {
            return
        }
        delegate?.loginButtonTapped(login: self.login, password: self.password)
    }
    
    func registerButtonTapped() {
        delegate?.registerButtonTapped()
    }
    
}
