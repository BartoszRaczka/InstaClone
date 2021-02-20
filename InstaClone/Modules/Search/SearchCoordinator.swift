//
//  SearchCoordinator.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

import UIKit

class SearchCoordinator: Coordinator {
    
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
        navigationController.tabBarItem = .init(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        let searchViewController = dependencyContainer.makeSearchViewController(delegate: self)
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
}

extension SearchCoordinator: SearchViewModelDelegate {
    
}
