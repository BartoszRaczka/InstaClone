//
//  OnboardingCoordinator.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private let coordinators = [Coordinator]()
    
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
        let onboardingViewController = dependencyContainer.makeOnboardingViewController()
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
    
    
}
