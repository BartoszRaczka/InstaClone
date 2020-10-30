//
//  PhotoPostViewController.swift
//  InstaClone
//
//  Created by new on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

final class PhotoPostViewController: UIViewController {
    
    private let viewModel: PhotoPostViewModel!
    
    init(with viewModel: PhotoPostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = PhotoPostView(viewModel: self.viewModel)
    }
}
