//
//  RegisterViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject{
    
    func addEmail(email: String)
    func registerButtonTapped()
    
}

final class RegisterViewModel {
    
    //    MARK: - Properties
    
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
    
    func buttonTapped() {
        guard let email = self.typedText else {
            return
        }
        delegate?.addEmail(email: email)
            
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
    func textFieldDidChange(with typedText: String) {
        
        self.typedText = typedText
        
    }
    
}
