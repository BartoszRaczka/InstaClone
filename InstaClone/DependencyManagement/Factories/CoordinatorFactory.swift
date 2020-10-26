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
    
}

extension DependencyContainer: CoordinatorFactory {
    
    func makeTabBarCoordinator(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) -> TabBarCoordinator {
        TabBarCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
    }
    
}