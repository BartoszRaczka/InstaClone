//
//  OnboardingViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol OnboardingViewModelDelegate {
    
    func loginButtonTapped()
    func registerButtonTapped()
    
}

class OnboardingViewModel {
    
    var delegate: OnboardingViewModelDelegate?
    private var userCredentials: UserCredentials
    var passwordTextFieldViewModel: TextFieldViewModel?
    var loginTextFieldViewModel: TextFieldViewModel?
    private let onboardingService = OnboardingService()
    var onFailedToLoginAction: (() -> ())?
    
    init(delegate: OnboardingViewModelDelegate) {
        self.delegate = delegate
        self.userCredentials = UserCredentials()
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
        onboardingService.login(with: userCredentials, completionHandler: { result in
            switch result {
            case .success:
                self.delegate?.loginButtonTapped()
            case .failure:
                self.onFailedToLoginAction?()
                print("failed to login")
            }
        })
    }
    
    func registerButtonTapped() {
        delegate?.registerButtonTapped()
    }
    
}
