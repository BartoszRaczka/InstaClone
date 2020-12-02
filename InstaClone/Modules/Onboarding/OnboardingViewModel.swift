//
//  OnboardingViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol OnboardingViewModelDelegate {
    
    func loginButtonTapped(userCredentials: UserCredentials)
    func registerButtonTapped()
    
}

class OnboardingViewModel {
    
    var delegate: OnboardingViewModelDelegate?
    var userCredentials: UserCredentials
    var passwordTextFieldViewModel: TextFieldViewModel?
    var loginTextFieldViewModel: TextFieldViewModel?
    
    init(login: String, password: String, delegate: OnboardingViewModelDelegate) {
        self.delegate = delegate
        self.userCredentials = UserCredentials(login: login, password: password)
    }
    
}

// MARK: - Public methods
extension OnboardingViewModel: TextFieldViewModelDelegate {
    
    func textFieldDidChange(in textFieldType: TextFieldType, with typedText: String) {
        switch textFieldType {
        case .login:
            self.userCredentials.login = typedText
        case .password:
            self.userCredentials.password = typedText
        }
    }
    
    func loginButtonTapped() {
        guard
            self.userCredentials.login != "",
            self.userCredentials.password != ""
        else {
            return
        }
        delegate?.loginButtonTapped(userCredentials: userCredentials)
    }
    
    func registerButtonTapped() {
        delegate?.registerButtonTapped()
    }
    
}
