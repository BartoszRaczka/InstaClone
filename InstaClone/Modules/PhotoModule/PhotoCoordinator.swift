//
//  PhotoCoordinator.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import UIKit

protocol PhotoCoordinatorDelegate {
    
    func photoCaptured()
    
}

class PhotoCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private let coordinators = [Coordinator]()
    var delegate: PhotoCoordinatorDelegate?
    
    //MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer,
        delegate: PhotoCoordinatorDelegate
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
        self.delegate = delegate
    }
    
    //MARK: - Public methods
    
    func start() {
        navigationController.tabBarItem = .init(title: "Photo", image: UIImage(systemName: "camera"), tag: 1)
        navigationController.pushViewController(dependencyContainer.makePhotoViewController(delegate: self), animated: true)
    }
    
}

extension PhotoCoordinator: PhotoViewModelDelegate {
    
    func photoCaptured() {
        self.delegate?.photoCaptured()
    }
    
    func capturePhotoButtonTapped() {
        (navigationController.topViewController as? PhotoViewController)?.capturePhotoButtonTapped()
    }
    
}
