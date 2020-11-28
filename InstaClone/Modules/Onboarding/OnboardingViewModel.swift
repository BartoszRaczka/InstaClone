//
//  OnboardingViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

class OnboardingViewModel {
    
    var login: String
    var password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}

// MARK: - Public methods
extension OnboardingViewModel: TextFieldViewModelDelegate {
    
    func textFieldDidEndEditing(in textFieldType: TextFieldType, with typedText: String) {
        switch textFieldType {
        case .login:
            self.login = typedText
        case .password:
            self.password = typedText
        }
    }
    
    func loginButtonTapped() {
        print("login button tapped in viewModel")
    }
    
    func registerButtonTapped() {
        print("register button tapped in viewModel")
    }
    
}
