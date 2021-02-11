//
//  SearchView.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

import SnapKit

class SearchView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: SearchViewModel
    
    // MARK: - UI Properties
    
    // TODO
    
    init(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
}
