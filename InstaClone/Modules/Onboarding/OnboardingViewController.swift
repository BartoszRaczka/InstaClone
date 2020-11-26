//
//  OnboardingViewController.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import SnapKit

final class OnboardingViewController: UIViewController {
    
    private let viewModel: OnboardingViewModel
    
    init(with viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        super.loadView()
        view = OnboardingView(with: self.viewModel)
    }
    
}
