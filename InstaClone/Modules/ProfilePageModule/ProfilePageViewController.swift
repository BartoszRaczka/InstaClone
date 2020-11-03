//
//  ProfilePageViewController.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

import SnapKit

final class ProfilePageViewController: UIViewController {
    
    private let viewModel: ProfilePageViewModel
    
    init(with viewModel: ProfilePageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        view = ProfilePageView(with: viewModel)
    }

}
