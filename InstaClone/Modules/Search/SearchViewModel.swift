//
//  SearchViewModel.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

import Foundation

protocol SearchViewModelDelegate {
    // TODO
}

class SearchViewModel {
    
    var delegate: SearchViewModelDelegate?
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
    }
    
}
