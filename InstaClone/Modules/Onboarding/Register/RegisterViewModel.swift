//
//  RegisterViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject{
    
    func registerButtonTapped()

}

final class RegisterViewModel {
    
    //    MARK: - Properties
    
    var loginTextFieldViewModel: TextFieldViewModel?
    var passwordTextFieldViewModel: TextFieldViewModel?
    
    private weak var delegate: RegisterViewModelDelegate?
    let registerService: RegisterServiceProtocol
    private var userCredentials: UserCredentials
    private var typedText: String?
    var onFailedToRegisterAction: (() -> ())?
    
    //    MARK: - Life Cycle
    
    init(delegate: RegisterViewModelDelegate, registerService: RegisterServiceProtocol) {
        self.delegate = delegate
        self.registerService = registerService
        self.userCredentials = UserCredentials()
    }
    
    //    MARK: - Public methods
    
}

extension RegisterViewModel: TextFieldViewModelDelegate {
    
    func textFieldDidChange(in textFieldType: TextFieldType, with typedText: String) {
        switch textFieldType {
        case .login:
            self.userCredentials.login = typedText
        case .password:
            self.userCredentials.password = typedText
        }
    }
    
    func buttonTapped() {
        guard
            self.userCredentials.login != "",
            self.userCredentials.password != ""
        else {
            return
        }
            
        registerService.createUser(with: userCredentials, completionHandler: { result in
            switch result {
            case .success:
                self.delegate?.registerButtonTapped()
            case .failure:
                self.onFailedToRegisterAction?()
                print("failed to register")
            }
        })
    }
}
