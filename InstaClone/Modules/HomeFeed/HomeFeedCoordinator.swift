//
//  HomeFeedCoordinator.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

protocol HomeFeedCoordinatorProtocol {
    
}

final class HomeFeedCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let dependencyContainer: DependencyContainer
    private var coordinators = [Coordinator]()
    
    // MARK: - Life Cycle
    
    init(
        with navigationController: UINavigationController,
        dependencyContainer: DependencyContainer
    ){
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    // MARK: - Public Methods
    
    func start() {
        navigationController.pushViewController(
            dependencyContainer.makeHomeFeedViewController(with: self),
            animated: false
        )
        navigationController.tabBarItem = .init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
    }
    
}

extension HomeFeedCoordinator: HomeFeedViewModelDelegate {
    
    func selectedButton() {
        
    }
    
}
