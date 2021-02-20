//
//  SearchViewModel.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    // TODO
}

class SearchViewModel {
    
    var delegate: SearchViewModelDelegate?
    var searchedPropositions: [String] = ["username 1", "username 2", "username 3"] //When the SearchService will be done we will override this array with proper data
    var cellViewModels: [SearchTableViewCellViewModel]
    var onReloadDataInTableViewAction: (() -> Void)?
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
        
        cellViewModels = searchedPropositions.map { proposition in
            let viewModel = SearchTableViewCellViewModel(username: proposition)
            return viewModel
        }
    }
    
}

// MARK: - Public Methods

extension SearchViewModel {
    
    func askForPropositions(with text: String) {
        // TODO: Ask service for propositons to show
        self.onReloadDataInTableViewAction?()
    }
    
}

extension SearchViewModel: SearchTableViewCellViewModelDelegate {
    
    func followButtonTapped(cellViewModel: SearchTableViewCellViewModel) {
        print("We have to give information to Firebase that logged user wants to follow \(cellViewModel.username)")
        // TODO: Give information to Firebase that logged user wants to follow another user
    }
    
}
