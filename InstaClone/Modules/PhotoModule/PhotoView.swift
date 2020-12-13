//
//  PhotoView.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import SnapKit

class PhotoView: UIView {
    
    private let viewModel: PhotoViewModel
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
}
