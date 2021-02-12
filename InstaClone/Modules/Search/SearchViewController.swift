//
//  SearchViewController.swift
//  InstaClone
//
//  Created by new on 10/02/2021.
//

import SnapKit

final class SearchViewController: UIViewController {
    
    private let viewModel: SearchViewModel
    private let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.placeholder?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
    }
    
}

// MARK: - private methods

private extension SearchViewController {
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "search..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        // TODO: powiedzenie viewModelowi żeby zapytał się serwisu o to co ma wyświetlać
        
//        (view as? AddNewCardView)?.isFiltering = isFiltering
//        (view as? AddNewCardView)?.tableView.reloadData()
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchBarText = searchBar.text else {
            return
        }
        filterContentForSearchText(searchBarText)
    }
    
}
