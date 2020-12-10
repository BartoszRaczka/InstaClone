//
//  CoordinatorFactory.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 16/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func makeTabBarCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> TabBarCoordinator

    func makeHomeFeedCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> HomeFeedCoordinator
    
    func makeProfilePageCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> ProfilePageCoordinator
    
    func makePhotoPostCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> PhotoPostCoordinator
    
    func makeUserProfileCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> UserProfileCoordinator
  
    func makePhotoCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> PhotoCoordinator
}

extension DependencyContainer: CoordinatorFactory {
    
    func makeProfilePageCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> ProfilePageCoordinator {
        ProfilePageCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
    }

    func makeTabBarCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> TabBarCoordinator {
        TabBarCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
    }

    func makePhotoPostCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> PhotoPostCoordinator {
        PhotoPostCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
    }
   
    func makeStoriesCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
        ) -> StoriesCoordinator {
        StoriesCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
    }

    func makeHomeFeedCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> HomeFeedCoordinator {
        HomeFeedCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
    }
       
    func makeUserProfileCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> UserProfileCoordinator {
        UserProfileCoordinator(
        with: navigationController,
        dependencyContainer: dependencyContainer
        )
    }
    
    func makePhotoCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> PhotoCoordinator {
        PhotoCoordinator(
        with: navigationController,
        dependencyContainer: dependencyContainer
        )
    }
        
}
