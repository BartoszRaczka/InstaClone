//
//  OnboardingCoordinator.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    
    func loginButtonTapped(login: String, password: String) //noone knows
    
}

class OnboardingCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private let coordinators = [Coordinator]()
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
    
    func loginButtonTapped(login: String, password: String) {
        delegate?.loginButtonTapped(login: login, password: password)
        print("coordinator knows about \(login) and \(password)")
    }
    
    func registerButtonTapped() {
//        let registerViewController = dependencyContainer.makeRegisterViewController(delegate: self)
//        navigationController.pushViewController(registerViewController, animated: true)
    }
    
}
