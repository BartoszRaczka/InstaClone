//
//  PhotoPostView.swift
//  InstaClone
//
//  Created by new on 18/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

class PhotoPostView: UIView, UITableViewDelegate {
    
    private let tableView = UITableView()
    let viewModel: PhotoPostViewModel
    
    init(viewModel: PhotoPostViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotoPostTableViewCell.self, forCellReuseIdentifier: "PhotoPostTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}


extension PhotoPostView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoPostTableViewCell", for: indexPath)
        (cell as? PhotoPostTableViewCell)?.viewModel.delegate = self.viewModel
        //TODO: add logic to display proper data for each post
        return cell
    }
}
