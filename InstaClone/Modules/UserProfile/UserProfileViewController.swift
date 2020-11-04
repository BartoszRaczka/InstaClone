//
//  UserProfileViewController.swift
//  InstaClone
//
//  Created by MacBook on 30/10/2020.
//

import SnapKit

final class UserProfileViewController: UIViewController {
    
    //    MARK: - Properties
    
    private let viewModel: UserProfileViewModel
    
    // MARK: - Life Cycle
    
    init(with viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        view = UserProfileView(with: viewModel)
    }
    
}
