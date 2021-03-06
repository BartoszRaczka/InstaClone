//
//  AppCoordinator.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 16/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit
import FirebaseAuth

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow
    private var navigationController = UINavigationController()
    private let dependencyContainer = DependencyContainer()
    private var coordinators = [Coordinator]()
    
    // MARK: - Life Cycle
    
    init(with window: UIWindow) {
        self.window = window
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Public methods
    
    func start() {
        if Auth.auth().currentUser != nil {
            self.startFromTabBar()
        } else {
            self.startFromOnboarding()
        }
    }
    
    // MARK: - Private methods
    
    private func startFromTabBar() {
        let coordinator = dependencyContainer.makeTabBarCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer
        )
        coordinators.append(coordinator)
        coordinator.start()
    }
    
    func startFromOnboarding() {
        let coordinator = dependencyContainer.makeOnboardingCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer,
            delegate: self
        )
        coordinators.append(coordinator)
        coordinator.start()
    }
    
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    
    func loginButtonTapped() {
        startFromTabBar()
    }
        
}

