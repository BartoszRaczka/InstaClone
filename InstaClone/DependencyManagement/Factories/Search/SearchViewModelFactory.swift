//
//  SearchViewModelFactory.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

protocol SearchViewModelFactory {
    
    func makeSearchViewModel(delegate: SearchViewModelDelegate) -> SearchViewModel
    
}

extension DependencyContainer: SearchViewModelFactory {
    
    func makeSearchViewModel(delegate: SearchViewModelDelegate) -> SearchViewModel {
        SearchViewModel(
            delegate: delegate
        )
    }
    
}
