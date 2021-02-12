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
    var searchedPropositions: [String] = [String]()
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
    }
    
}

// MARK: - Public Methods

extension SearchViewModel {
    
    func askForPropositions() {
        // TODO: Ask service for propositons to show
    }
    
}

extension SearchViewModel: SearchTableViewCellViewModelDelegate {
    
    func followButtonTapped() {
        print("We have to give information to Firebase that logged user wants to follow another user!")
        // TODO: Give information to Firebase that logged user wants to follow another user
    }
    
}

//wpisuje text -> wysyłam requesta z textem (litery lowercased) o propozycje do wyświetlania -> dostaje około 20 propozycji do wyświetlenia w tableview -> wyświetlam te propozycje -> klikam follow -> wysyłam requesta do serwisu z informacją że followuje osobę XYZ -> zmieniam label na unfollow
