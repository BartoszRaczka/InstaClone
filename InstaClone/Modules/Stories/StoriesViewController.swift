//
//  StoriesViewController.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class StoriesViewController: UIViewController {
    
    private let viewModel: StoriesViewModel
    
    init(with viewModel: StoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        view = StoriesView(with: viewModel)
    }
}
