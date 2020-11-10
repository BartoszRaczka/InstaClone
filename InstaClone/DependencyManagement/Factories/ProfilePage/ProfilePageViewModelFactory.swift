//
//  ProfilePageViewModelFactory.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

protocol ProfilePageViewModelFactory {
    
    func makeProfilePageViewModel(delegate: ProfilePageViewModelDelegate) -> ProfilePageViewModel
    
}

extension DependencyContainer: ProfilePageViewModelFactory {
    
    func makeProfilePageViewModel(delegate: ProfilePageViewModelDelegate) -> ProfilePageViewModel {
        ProfilePageViewModel(
            numberOfPosts: 1,
            numberOfFollowers: 0,
            numberOfFollowing: 0,
            descriptionLabelText: "Description",
            delegate: delegate
        )
    }
    
}
