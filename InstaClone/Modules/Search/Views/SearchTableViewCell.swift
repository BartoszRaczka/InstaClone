//
//  SearchTableViewCell.swift
//  InstaClone
//
//  Created by new on 12/02/2021.
//

import SnapKit

final class SearchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var viewModel: SearchTableViewCellViewModel!
    
    // MARK: - UI Properties
    
    private var nameLabel: UILabel!
    private var followButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.viewModel = SearchTableViewCellViewModel()
        
        setupNameLabel()
        setupFollowButton()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Objective C functions for buttons
    
    @objc private func followButtonTapped() {
        viewModel.followButtonTapped()
    }

}

// MARK: - View setup

private extension SearchTableViewCell {
    
    func setupNameLabel() {
        nameLabel = UILabel()
        addSubview(nameLabel)
        
        nameLabel.text = viewModel.username
        
        nameLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
    }
    
    func setupFollowButton() {
        followButton = UIButton(type: .system)
        addSubview(followButton)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.contentHorizontalAlignment = .center
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        
        followButton.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }
    }
    
}
