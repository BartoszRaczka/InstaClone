//
//  ProfilePageViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

protocol ProfilePageViewControlerFactory {
    
    func makeProfilePageViewController(delegate: ProfilePageViewModelDelegate) -> ProfilePageViewController
    
}

extension DependencyContainer: ProfilePageViewControlerFactory {
    
    func makeProfilePageViewController(delegate: ProfilePageViewModelDelegate) -> ProfilePageViewController {
        ProfilePageViewController(with: makeProfilePageViewModel(delegate: delegate, userProfileService: userProfileService as! UserProfileService))
    }
    
}
