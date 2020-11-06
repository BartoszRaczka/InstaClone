//
//  PhotoPostCoordinator.swift
//  InstaClone
//
//  Created by new on 18/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class PhotoPostCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private let coordinators = [Coordinator]()
    private var photoPostViewController: UIViewController!
    
    // MARK: - LifeCycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    // MARK: - Public methods
    
    func start() {
        photoPostViewController = dependencyContainer.makePhotoPostViewController(delegate: self)
        navigationController.pushViewController(photoPostViewController, animated: true)
    }
    
    func rootViewController() -> UIViewController {
        photoPostViewController
    }
    
}

extension PhotoPostCoordinator: PhotoPostViewModelDelegate { //coordinator still doesn't know in which cell were this icons tapped. TODO: add indexPath(?) in functions parameters
    func didTapPosterNameButton() {
        //TODO
    }
    
    func didTapMoreOptionsButton() {
        //TODO
    }
    
    func didTapLikeButton() {
        //TODO
    }
    
    func didTapCommentButton() {
        //TODO
    }
    
    func didTapDMButton() {
        //TODO
    }
    
    func didTapSaveButton() {
        //TODO
    }
    
    func didTapNumberOfLikesButton() {
        //TODO
    }
}
