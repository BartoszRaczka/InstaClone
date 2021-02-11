//
//  SearchViewController.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

import SnapKit

final class SearchViewController: UIViewController {
    
    private let viewModel: SearchViewModel
    
    init(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        super.loadView()
        view = SearchView(with: self.viewModel)
    }
    
}

