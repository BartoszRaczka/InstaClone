//
//  HomeFeedCoordinator.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

protocol HomeFeedCoordinatorProtocol {
    
}

final class HomeFeedCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private var coordinators = [Coordinator]()
    
    // MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ){
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    // MARK: - Public Methods
    
    func start() {
        let photoPostCoordinator = dependencyContainer.makePhotoPostCoordinator(
            with: self.navigationController,
            dependencyContainer: self.dependencyContainer
        )
        photoPostCoordinator.start()
        
        let storiesCoordinator = dependencyContainer.makeStoriesCoordinator(
            with: self.navigationController,
            dependencyContainer: self.dependencyContainer
        )
        storiesCoordinator.start()
        
        navigationController.pushViewController(
            dependencyContainer.makeHomeFeedViewController(
                with: self,
                childViewControllers: [
                    storiesCoordinator.rootViewController(),
                    photoPostCoordinator.rootViewController()
                ]
            ),
            animated: false
            )
        navigationController.tabBarItem = .init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
    }
    
}

extension HomeFeedCoordinator: HomeFeedViewModelDelegate {
    
    func selectedButton() {
        
    }
    
}
