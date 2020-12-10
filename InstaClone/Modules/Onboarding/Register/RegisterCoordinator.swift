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
        let registerViewController = dependencyContainer.makeRegisterViewController(delegate: self)
        navigationController.pushViewController(registerViewController, animated: true)
    }

}

extension RegisterCoordinator: RegisterViewModelDelegate, PinInputViewModelDelegate {
  
    func addPhoneNumber(phoneNumber: String) {
        let pinInputViewController = dependencyContainer.makePinInputViewController(delegate: self)
        navigationController.pushViewController(pinInputViewController, animated: true)
    }

    func pinEntered(pin: String) {
        print("pin entered")
    }
    
}
