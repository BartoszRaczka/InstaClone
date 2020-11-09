//
//  StoriesCoordinator.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

final class StoriesCoordinator: Coordinator {
    
    //   MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private var coordinators = [Coordinator]()
    
    lazy var rootViewController: UIViewController = {
        self.dependencyContainer.makeStoriesViewController(delegate: self)
    }()
    
    //    MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    //  MARK: - Public methods
    
    func start() {
        // For now - we don't do nothing here
    }
    
}

extension StoriesCoordinator: StoriesViewModelDelegate {
    
    func selectedUser() {
        //TODO
    }
    
}
