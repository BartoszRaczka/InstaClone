//
//  UserProfileView.swift
//  InstaClone
//
//  Created by MacBook on 30/10/2020.
//

import SnapKit

final class UserProfileView: UIView {
    
    var viewModel: UserProfileViewModel
    
    init(with viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
