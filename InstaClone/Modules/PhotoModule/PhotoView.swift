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

    private var previewView: UIView!
    private var capturePhotoButton: UIButton!
    private var capturedPhotoView: UIImageView!
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setupPreviewView()
        setupCapturePhotoButton()
        bindActions()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

}

// MARK: - Public methods
extension PhotoView {
    
    func setupCapturedPhoto(with image: UIImage) {
        capturedPhotoView = UIImageView(image: image)
        addSubview(capturedPhotoView)
        
        capturedPhotoView.snp.makeConstraints { make in
            make.leading.bottom.equalTo(safeAreaLayoutGuide).inset(4.0)
            make.height.width.equalTo(64.0)
        }
    }
    
}

// MARK: - Private methods
private extension PhotoView {
    
    @objc func didTapCapturePhotoButton() {
        viewModel.capturePhotoButtonTapped()
    }
    
    func bindActions() {
        viewModel.onPhotoCapturedAction = { image in
            self.setupCapturedPhoto(with: image)
        }
    }
    
}

// MARK: - View setup
private extension PhotoView {
    
    func setupPreviewView() {
        previewView = UIView()
        addSubview(previewView)
        
        previewView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupCapturePhotoButton() {
        capturePhotoButton = UIButton(type: .system)
        addSubview(capturePhotoButton)
        
        capturePhotoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(4.0)
            make.height.width.equalTo(64.0)
        }
        
        capturePhotoButton.backgroundColor = UIColor.lightGray
        capturePhotoButton.layer.cornerRadius = 32.0
        capturePhotoButton.layer.borderWidth = 1.0
        capturePhotoButton.layer.borderColor = UIColor.black.cgColor
        capturePhotoButton.addTarget(self, action: #selector(didTapCapturePhotoButton), for: .touchUpInside)
    }
    
}
