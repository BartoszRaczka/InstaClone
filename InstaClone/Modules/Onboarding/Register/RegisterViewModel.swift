//
//  RegisterViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject{
    
    func addEmail(email: String)
    
}

final class RegisterViewModel {
    
    //    MARK: - Properties
    
    private weak var delegate: RegisterViewModelDelegate?
    
    let registerService: RegisterServiceProtocol
    
    private var typedText: String?
    
    //    MARK: - Life Cycle
    
    init(delegate: RegisterViewModelDelegate, registerService: RegisterServiceProtocol) {
        self.delegate = delegate
        self.registerService = registerService
    }
    
    //    MARK: - Public methods
    
    func buttonTapped() {
        guard let email = self.typedText else {
            return
        }
        delegate?.addEmail(email: email)
    }
    
    func textFieldDidChange(with typedText: String) {
        
        self.typedText = typedText
        
    }
    
}
