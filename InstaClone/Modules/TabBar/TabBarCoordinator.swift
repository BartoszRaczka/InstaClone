//
//  TabBarCoordinator.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 16/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private var coordinators = [Coordinator]()
    
    // MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    // MARK: - Public methods
    
    func start() {
        startFromProfilePage()
        startFromPhotoPost()
        //let homeFeedNavigationController = UINavigationController()
        //let homeFeedCoordinator = dependencyContainer.makeHomeFeedCoordinator(with: homeFeedNavigationController)
        //coordinators.append(homeFeedCoordinator)
        
//        let tabBarViewController = TabBarViewController()
//        tabBarViewController.viewControllers = [homeFeedNavigationController]
//        navigationController.pushViewController(tabBarViewController, animated: false)
    }
    
    private func startFromProfilePage() {
        let coordinator = dependencyContainer.makeProfilePageCoordinator(
            with: self.navigationController,
            dependencyContainer: self.dependencyContainer
        )
        coordinators.append(coordinator)
        coordinator.start()
    }

    private func startFromPhotoPost() {
        let coordinator = dependencyContainer.makePhotoPostCoordinator(
            with: self.navigationController,
            dependencyContainer: self.dependencyContainer
        )
        coordinators.append(coordinator)
        coordinator.start()
    }
    
}
