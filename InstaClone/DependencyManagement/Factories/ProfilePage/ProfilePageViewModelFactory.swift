//
//  ProfilePageViewModelFactory.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

protocol ProfilePageViewModelFactory {
    
    func makeProfilePageViewModel(delegate: ProfilePageViewModelDelegate, userProfileService: UserProfileService) -> ProfilePageViewModel
    
}

extension DependencyContainer: ProfilePageViewModelFactory {
    
    func makeProfilePageViewModel(delegate: ProfilePageViewModelDelegate, userProfileService: UserProfileService) -> ProfilePageViewModel {
        ProfilePageViewModel(
            delegate: delegate,
            userProfileService: userProfileService
        )
    }
    
}
