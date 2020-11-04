//
//  UserProfileCoordinator.swift
//  InstaClone
//
//  Created by MacBook on 30/10/2020.
//

import SnapKit

protocol UserProfileCoordinatorProtocol {
    
}

final class UserProfileCoordinator: Coordinator {
  
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
    
    }
    
}
