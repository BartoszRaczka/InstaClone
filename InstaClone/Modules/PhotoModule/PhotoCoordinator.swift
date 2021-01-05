//
//  PhotoCoordinator.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import UIKit

class PhotoCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private let coordinators = [Coordinator]()
//    private var photoViewController: PhotoViewController!
    
    //MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    //MARK: - Public methods
    
    func start() {
//        photoViewController = dependencyContainer.makePhotoViewController(delegate: self)
        navigationController.tabBarItem = .init(title: "Photo", image: UIImage(systemName: "camera"), tag: 1)
        navigationController.pushViewController(dependencyContainer.makePhotoViewController(delegate: self), animated: true)
    }
    
}

extension PhotoCoordinator: PhotoViewModelDelegate {
    
    func capturePhotoButtonTapped() {
        photoViewController.capturePhotoButtonTapped()
    }
    
}
