//
//  PinInputViewController.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import SnapKit

final class PinInputViewController: UIViewController {
    
    private let viewModel: PinInputViewModel
    
    init(with viewModel: PinInputViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        super.loadView()
        view = PinInputView(with: self.viewModel)
    }
    
}
