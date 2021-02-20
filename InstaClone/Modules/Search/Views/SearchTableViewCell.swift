//
//  SearchTableViewCell.swift
//  InstaClone
//
//  Created by new on 12/02/2021.
//

import SnapKit

final class SearchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var viewModel: SearchTableViewCellViewModel?
    
    // MARK: - UI Properties
    
    private var nameLabel: UILabel!
    private var followButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        isUserInteractionEnabled = true
        
        setupNameLabel()
        setupFollowButton()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Objective C functions for buttons
    
    @objc private func followButtonTapped() {
        viewModel?.followButtonTapped()
    }
    
    // MARK: - Public Functions
    
    func update(with viewModel: SearchTableViewCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.username
    }
    
}

// MARK: - View setup

private extension SearchTableViewCell {
    
    func setupNameLabel() {
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(8.0)
        }
    }
    
    func setupFollowButton() {
        followButton = UIButton(type: .system)
        contentView.addSubview(followButton)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.contentHorizontalAlignment = .center
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        followButton.layer.cornerRadius = 6.0
        followButton.backgroundColor = .systemBlue
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        followButton.setTitleColor(.white, for: .normal)
        
        followButton.snp.makeConstraints { make in
            make.height.equalTo(32.0)
            make.width.equalTo(88.0)
            make.leading.equalTo(nameLabel.snp.trailing)
            make.top.bottom.trailing.equalToSuperview().inset(8.0)
        }
    }
    
}
