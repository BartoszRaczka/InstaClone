//
//  PhotoViewController.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import SnapKit

class PhotoViewController: UIViewController {
    
    private let viewModel: PhotoViewModel!
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
