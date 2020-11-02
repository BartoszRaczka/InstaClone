//
//  UserProfileView.swift
//  InstaClone
//
//  Created by MacBook on 30/10/2020.
//

import SnapKit

final class UserProfileView: UIView {
    
    var viewModel: UserProfileViewModel
    
    private var profileButton: UIButton!
    
    init(with viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileButton() {
            profileButton = UIButton()
            addSubview(profileButton)
            
            profileButton.snp.makeConstraints{ make in
                make.edges.equalToSuperview()
            }
    }
    
    private func setupView() {
        setupProfileButton()
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
    }

    @objc func didTapProfileButton() {
        
    }
    
}
