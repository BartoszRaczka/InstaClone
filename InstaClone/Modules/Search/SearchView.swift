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
    
    private var tableView: UITableView!
    
    init(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        viewModel.askForPropositions()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
}

// MARK: - View setup

extension SearchView {
    
    func setupTableView() {
        tableView = UITableView()
        addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

extension SearchView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.searchedPropositions.count
        return 2 // This is for now to test tableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath)
        (cell as? SearchTableViewCell)?.viewModel.delegate = self.viewModel
        //TODO: add logic to display searched propositions
        return cell
    }
}
