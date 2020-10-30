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
        startFromPhotoPost()
        
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
    
    private func startFromPhotoPost() {
        let navigationController = UINavigationController() //I think this line is unnesessary because navigationController have been created in startFromTabBar method and maybe we should make one navigationController for every method?
        let coordinator = dependencyContainer.makePhotoPostCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
        coordinators.append(coordinator)
        coordinator.start()
    
        window.rootViewController = navigationController //I think this line is unnecessary too
    }
    
}
