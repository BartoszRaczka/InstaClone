//
//  RegisterViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject{
    
    func addPhoneNumber(phoneNumber: String)
    
}

final class RegisterViewModel {
    
    //    MARK: - Properties
    
    private weak var delegate: RegisterViewModelDelegate?
    
    private var typedText: String?
    
    //    MARK: - Life Cycle
    
    init(delegate: RegisterViewModelDelegate) {
        self.delegate = delegate
    }
    
    //    MARK: - Public methods
    
    func buttonTapped() {
        guard let phoneNumber = self.typedText else {
            return
        }
        delegate?.addPhoneNumber(phoneNumber: phoneNumber)
    }
    
    func textFieldDidChange(with typedText: String) {
        
        self.typedText = typedText
        
    }
    
}
