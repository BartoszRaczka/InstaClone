//
//  HomeFeedViewController.swift
//  InstaClone
//
//  Created by MacBook on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

final class HomeFeedViewController: UIViewController {

    //    MARK: - Properties
    
    private let viewModel: HomeFeedViewModel
    
//    MARK: - Life Cycle
    
    init(with viewModel: HomeFeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HomeFeedView(with: viewModel)
        }
    
}
