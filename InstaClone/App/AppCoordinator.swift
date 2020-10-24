//
//  AppCoordinator.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 16/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow
    private let dependencyContainer = DependencyContainer()
    private var coordinators = [Coordinator]()
    
    // MARK: - Life Cycle
    
    init(with window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Public methods
    
    func start() {
        startFromTabBar()
        
        window.makeKeyAndVisible()
    }
    
    // MARK: - Private methods
    
    private func startFromTabBar() {
        let navigationController = UINavigationController()
        let coordinator = dependencyContainer.makeTabBarCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
        coordinators.append(coordinator)
        coordinator.start()
        
        window.rootViewController = navigationController
    }
    
}
