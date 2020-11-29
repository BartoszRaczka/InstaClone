//
//  RegisterCoordinator.swift
//  InstaClone
//
//  Created by MacBook on 29/11/2020.
//

import SnapKit

protocol RegisterCoordinatorDelegate: AnyObject {
    
}

final class RegisterCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private weak var delegate: RegisterCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private var coordinators = [Coordinator]()
    
    //MARK: - Life cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer,
        delegate: RegisterCoordinatorDelegate
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
        self.delegate = delegate
    }
    
    //MARK: - Public methods
    
    func start() {
        let registerNavigationController = UINavigationController()
        let registerCoordinator = dependencyContainer.makeRegisterCoordinator(
            with: registerNavigationController,
            dependencyContainer: dependencyContainer,
            delegate: delegate
        )
    
    }

}
