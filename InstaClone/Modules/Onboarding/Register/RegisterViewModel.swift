//
//  RegisterViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject{
    
    func addPhoneNumber()
    
}

final class RegisterViewModel {
    
    //    MARK: - Properties
    
    private weak var delegate: RegisterViewModelDelegate?
    
    //    MARK: - Life Cycle
    
    init(delegate: RegisterViewModelDelegate) {
        self.delegate = delegate
    }
    
    //    MARK: - Public methods
    
    func addPhoneNumber() {
        
    }
    
}
