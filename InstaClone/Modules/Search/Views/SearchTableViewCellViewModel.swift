//
//  SearchTableViewCellViewModel.swift
//  InstaClone
//
//  Created by new on 12/02/2021.
//

import Foundation

protocol SearchTableViewCellViewModelDelegate: AnyObject {
    
    func followButtonTapped(cellViewModel: SearchTableViewCellViewModel)
    
}

final class SearchTableViewCellViewModel {
    
    var delegate: SearchTableViewCellViewModelDelegate?
    var username: String
    
    init(username: String) {
        self.username = username
    }
    
    func followButtonTapped() {
        delegate?.followButtonTapped(cellViewModel: self)
    }
    
}
