//
//  ProfilePageCoordinator.swift
//  InstaClone
//
//  Created by new on 01/11/2020.
//

import UIKit

final class ProfilePageCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private let coordinators = [Coordinator]()
    
    //MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    //MARK: - Public methods
    
    func start() {
        let profilePageViewController = dependencyContainer.makeProfilePageViewController(delegate: self)
        navigationController.pushViewController(profilePageViewController, animated: true)
    }
    
}

extension ProfilePageCoordinator: ProfilePageViewModelDelegate {
   
    func didTapUserProfilePictureButton() {
        //TODO
    }
    
    func didTapNumberOfPostsButton() {
        //TODO
    }
    
    func didTapNumberOfFollowersButton() {
        //TODO
    }
    
    func didTapNumberOfFollowingButton() {
        //TODO
    }
    
    func didTapEditProfileButton() {
        //TODO
    }
    
}
