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
        //let homeFeedNavigationController = UINavigationController()
        //let homeFeedCoordinator = dependencyContainer.makeHomeFeedCoordinator(with: homeFeedNavigationController)
        //coordinators.append(homeFeedCoordinator)
        
//        let tabBarViewController = TabBarViewController()
//        tabBarViewController.viewControllers = [homeFeedNavigationController]
//        navigationController.pushViewController(tabBarViewController, animated: false)
    }
    
}
