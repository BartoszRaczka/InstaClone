//
//  PhotoPostView.swift
//  InstaClone
//
//  Created by new on 18/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import SnapKit

final class PhotoPostView: UIView, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let viewModel: PhotoPostViewModel
    
    init(viewModel: PhotoPostViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotoPostCell.self, forCellReuseIdentifier: "PhotoPostCell")
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoPostCell", for: indexPath)
        (cell as? PhotoPostCell)?.viewModel.delegate = self.viewModel
        //TODO: add logic to display proper data for each post
        return cell
    }
}
