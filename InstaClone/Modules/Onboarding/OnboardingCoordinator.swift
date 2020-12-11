//
//  OnboardingCoordinator.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    
    func loginButtonTapped()
    
}

class OnboardingCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private var coordinators = [Coordinator]()
    var delegate: OnboardingCoordinatorDelegate?
    
    // MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer,
        delegate: OnboardingCoordinatorDelegate
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    
    func start() {
        let onboardingViewController = dependencyContainer.makeOnboardingViewController(delegate: self)
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
    
}

extension OnboardingCoordinator: OnboardingViewModelDelegate {
    
    func loginButtonTapped() {
        delegate?.loginButtonTapped()
    }
    
    func registerButtonTapped() {
        let coordinator = dependencyContainer.makeRegisterCoordinator(
            with: navigationController,
            dependencyContainer: dependencyContainer,
            delegate: self
        )
        coordinators.append(coordinator)
        coordinator.start()
    }
    
}

extension OnboardingCoordinator: RegisterCoordinatorDelegate {
    
}


