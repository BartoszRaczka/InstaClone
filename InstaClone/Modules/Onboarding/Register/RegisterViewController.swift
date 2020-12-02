//
//  RegisterViewController.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import SnapKit

final class RegisterViewController: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel: RegisterViewModel
    
    //MARK: - Life cycle
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
//        view = RegisterView(with: viewModel)
    }
    
}
