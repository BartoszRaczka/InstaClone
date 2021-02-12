//
//  SearchTableViewCellViewModel.swift
//  InstaClone
//
//  Created by new on 12/02/2021.
//

import Foundation

protocol SearchTableViewCellViewModelDelegate: AnyObject {
    
    func followButtonTapped()
    
}

final class SearchTableViewCellViewModel {
    
    var delegate: SearchTableViewCellViewModelDelegate?
    
    func followButtonTapped() {
        delegate?.followButtonTapped()
    }
    
}
