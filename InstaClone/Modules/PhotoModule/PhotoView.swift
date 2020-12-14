//
//  PhotoView.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import SnapKit

class PhotoView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: PhotoViewModel
    
    // MARK: - UI Properties
    
    private var capturePhotoButton: UIButton!
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setupCameraView()
        setupCapturePhotoButton()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

}

// MARK: - View setup
extension PhotoView {
    
    func setupCameraView() {
        
    }
    
    func setupCapturePhotoButton() {
        
    }
    
}
