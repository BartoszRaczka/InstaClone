//
//  SearchTableViewCellViewModel.swift
//  InstaClone
//
//  Created by new on 12/02/2021.
//

import Foundation

protocol SearchTableViewCellViewModelDelegate: AnyObject {
    
    func followButtonTapped(row: Int)
    
}

final class SearchTableViewCellViewModel {
    
    var delegate: SearchTableViewCellViewModelDelegate?
    var numberOfCellsRow: Int?
    var username: String = "username"
    
    func followButtonTapped() {
        guard let row = numberOfCellsRow else {
            return
        }
        delegate?.followButtonTapped(row: row)
    }
    
}
