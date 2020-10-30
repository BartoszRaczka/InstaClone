//
//  UserProfileViewModelFactory.swift
//  InstaClone
//
//  Created by MacBook on 30/10/2020.
//

import Foundation

protocol UserProfileViewModelFactory {
    
    func makeUserProfileViewModel(delegate: UserProfileViewModelDelegate) -> UserProfileViewModel
    
}

extension DependencyContainer: UserProfileViewModelFactory {
    
    func makeUserProfileViewModel(delegate: UserProfileViewModelDelegate) -> UserProfileViewModel {
        UserProfileViewModel(delegate: delegate)
    }
    
    
    
}
