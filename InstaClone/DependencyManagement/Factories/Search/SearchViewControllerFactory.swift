//
//  SearchViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

protocol SearchViewControllerFactory {
    
    func makeSearchViewController(delegate: SearchViewModelDelegate) -> SearchViewController

}

extension DependencyContainer: SearchViewControllerFactory {
    
    func makeSearchViewController(delegate: SearchViewModelDelegate) -> SearchViewController {
        SearchViewController(with: makeSearchViewModel(delegate: delegate))
    }
    
}
