//
//  PhotoView.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import SnapKit
import AVKit

class PhotoView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: PhotoViewModel
    
    // MARK: - UI Properties
    
    private var previewView: PreviewView!
    private var capturePhotoButton: UIButton!
    
    // MARK: - AV Properties
    private var captureSession: AVCaptureSession!
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setupCapturePhotoButton()
//        connectInputsAndOutputsToTheSession()
//        displayACameraPreview()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Public Methods
    
    @objc func didTapCapturePhotoButton() {
        viewModel.capturePhotoButtonTapped(with: UIImage())
    }

}

// MARK: - Capture Session Setup
private extension PhotoView {
    
    func connectInputsAndOutputsToTheSession() {
        captureSession = AVCaptureSession()
        
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
        
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            captureSession.canAddInput(videoDeviceInput)
        else {
            return
        }
        captureSession.addInput(videoDeviceInput)
        
        let photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
    }
    
    func displayACameraPreview() {
        self.previewView = PreviewView()
        self.previewView.videoPreviewLayer.session = self.captureSession
        addSubview(previewView)
        
        previewView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - View setup
private extension PhotoView {
    
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
