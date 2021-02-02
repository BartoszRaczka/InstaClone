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
    private var registerService: RegisterServiceProtocol
    
    //MARK: - Life cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer,
        delegate: RegisterCoordinatorDelegate,
        registerService: RegisterServiceProtocol
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
        self.delegate = delegate
        self.registerService = registerService
    }
    
    //MARK: - Public methods
    
    func start() {
        let registerViewController = dependencyContainer.makeRegisterViewController(delegate: self, registerService: registerService)
        navigationController.pushViewController(registerViewController, animated: true)
    }

}

extension RegisterCoordinator: RegisterViewModelDelegate {
  
    func registerButtonTapped() {
        
    }
    
}
